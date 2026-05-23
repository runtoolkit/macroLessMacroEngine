# PUBLIC API -- mlme:api/state/get
# macroLessMacroEngine v1.0.0
#
# Get a named state value.
# Output: mlme:output state.value (string) -- empty string if not found
#
# Input:
# mlme:input state.key -- string, state key to look up
#
# Usage:
# data modify storage mlme:input state.key set value "boss_active"
# function mlme:api/state/get
# data get storage mlme:output state.value

data remove storage mlme:output state.value
execute store result score #st.size mlme.tick run data get storage mlme:engine state
execute if score #st.size mlme.tick matches 1.. run function mlme:core/state/find_key
data remove storage mlme:input state.key