# Private: not part of MLME public API -- subject to change without notice
execute if score #st.idx mlme.tick >= #st.size mlme.tick run return 0
data modify storage mlme:temp st_entry set from storage mlme:engine state[0]
data modify storage mlme:engine state append from storage mlme:engine state[0]
data remove storage mlme:engine state[0]
scoreboard players add #st.idx mlme.tick 1
function mlme:core/state/find_iter
