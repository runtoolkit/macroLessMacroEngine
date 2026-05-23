# PUBLIC API -- mlme:api/state/clear
# macroLessMacroEngine v1.0.0
#
# Remove a named state entry.
#
# Input:
# mlme:input state.key -- string, state key to remove
#
# Usage:
# data modify storage mlme:input state.key set value "boss_active"
# function mlme:api/state/clear

function mlme:core/state/remove_key
data remove storage mlme:input state.key