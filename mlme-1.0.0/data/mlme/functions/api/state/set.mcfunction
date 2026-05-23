# PUBLIC API -- mlme:api/state/set
# macroLessMacroEngine v1.0.0
#
# Set a named state value. Values are stored as strings.
# Without macros, states are stored in a searchable list.
#
# Input:
#   mlme:input state.key   -- string, state key name
#   mlme:input state.value -- string, state value
#
# Usage:
#   data modify storage mlme:input state.key   set value "boss_active"
#   data modify storage mlme:input state.value set value "1"
#   function mlme:api/state/set

# Remove old entry with this key first, then append new one
function mlme:core/state/remove_key
data modify storage mlme:engine state append value {k:"",v:""}
data modify storage mlme:engine state[-1].k set from storage mlme:input state.key
data modify storage mlme:engine state[-1].v set from storage mlme:input state.value
data remove storage mlme:input state
