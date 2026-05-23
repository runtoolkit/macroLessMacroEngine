# PUBLIC API -- mlme:api/schedule/cancel_repeating
# macroLessMacroEngine v1.0.0
#
# Deactivate a repeating schedule by ID.
# The entry stays in storage with active:0b, preventing re-queueing.
#
# Macro-free limitation: cannot match by ID string without macros.
# This clears ALL repeating schedules (nuclear option).
# For per-ID cancel, maintain active flags in your own pack.
#
#   data modify storage mlme:input repeat.id set value "mypack_heartbeat"
#   function mlme:api/schedule/cancel_repeating

data remove storage mlme:engine repeating
data remove storage mlme:input repeat
