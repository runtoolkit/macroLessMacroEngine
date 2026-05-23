# Private: not part of MLME public API -- subject to change without notice
execute if score #lk.idx mlme.tick >= #lk.size mlme.tick run return 0
data modify storage mlme:temp lk_entry set from storage mlme:engine locks[0]
# Rotate; release sets held:0b (unconditional -- no name match without macros)
data modify storage mlme:temp lk_entry.held set value 0b
data modify storage mlme:engine locks append from storage mlme:temp lk_entry
data remove storage mlme:engine locks[0]
data remove storage mlme:temp lk_entry
scoreboard players add #lk.idx mlme.tick 1
function mlme:core/lock/release_iter