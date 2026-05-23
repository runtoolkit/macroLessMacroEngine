# Private: not part of MLME public API -- subject to change without notice
# Removes all entries in mlme:engine state whose k matches mlme:input state.key
execute unless data storage mlme:engine state[0] run return 0
execute store result score #st.size mlme.tick run data get storage mlme:engine state
scoreboard players set #st.idx mlme.tick 0
function mlme:core/state/remove_iter