# Private: not part of MLME public API -- subject to change without notice
execute if score #st.idx mlme.tick >= #st.size mlme.tick run return 0

data modify storage mlme:temp st_entry set from storage mlme:engine state[0]

# If key matches, discard it; otherwise rotate to end
execute if data storage mlme:temp {st_entry:{k:""}} run function mlme:core/state/check_key_match
execute unless data storage mlme:temp {st_entry:{k:""}} run function mlme:core/state/rotate_entry

scoreboard players add #st.idx mlme.tick 1
function mlme:core/state/remove_iter
