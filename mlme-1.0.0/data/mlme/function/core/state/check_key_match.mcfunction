# Private: not part of MLME public API -- subject to change without notice
#
# MACRO-FREE KEY MATCH LIMITATION:
# Without $(var) macro interpolation it is impossible to construct a data match
# predicate with a runtime-variable string value in a single function call.
#
# Design decision: state keys are matched by rotating the list and letting the
# caller use `data modify ... set from storage mlme:input state.key` to overwrite
# the k field, then checking if the entry.k now equals the overwritten value.
# This works because NBT data modify is by-value copy, and we can compare
# the *before* value (stored in k_orig) against the *after* (input key) using
# the execute store + scoreboard comparison of data get lengths -- but only for
# byte-length equality, not content equality.
#
# Practical macro-free solution: entries are rotated to end unconditionally.
# Removal works by building a new list excluding matched entries.
# Matching is done by writing input key into a probe compound and using
# `execute if data storage X {compound}` -- which CAN match dynamic values
# IF the compound is built at runtime.

# Build probe: {k: <input_key>}
data modify storage mlme:temp kprobe set value {k:""}
data modify storage mlme:temp kprobe.k set from storage mlme:input state.key

# Overwrite st_entry.k with input key, save original
data modify storage mlme:temp st_orig_k set from storage mlme:temp st_entry.k
data modify storage mlme:temp st_entry.k set from storage mlme:input state.key

# Now compare: if st_entry.k was already equal to input key, then
# overwriting it produces the same value -- and st_orig_k == input key.
# We verify by checking if st_orig_k matches the kprobe.k:
# Copy st_orig_k into kprobe for compound match
data modify storage mlme:temp verify set value {a:"",b:""}
data modify storage mlme:temp verify.a set from storage mlme:temp st_orig_k
data modify storage mlme:temp verify.b set from storage mlme:input state.key

# If a == b, the string values are identical (NBT compound field equality).
# Use: data modify storage mlme:temp verify.b set from storage mlme:temp st_orig_k
# then check if verify compound has matching a and b -- but this still can't
# compare two runtime strings without macros.
#
# FINAL DECISION: Accept the limitation. State API works correctly only when
# keys are pre-known constants. For runtime dynamic keys, callers should use
# mlme:engine state directly with `data modify storage mlme:engine state.<key>`.
# The list-based remove is documented as "clears by position, not by name match"
# in 1.19 mode. Macro-free string equality of two runtime values is not possible.

# Unconditionally rotate entry to end (safe no-op for remove_key in 1.19 mode)
function mlme:core/state/rotate_entry

data remove storage mlme:temp kprobe
data remove storage mlme:temp st_orig_k
data remove storage mlme:temp verify
