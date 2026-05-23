# Private: not part of MLME public API -- subject to change without notice
execute if score #lk.idx mlme.tick >= #lk.size mlme.tick run function mlme:core/lock/acquire_new
execute if score #lk.idx mlme.tick >= #lk.size mlme.tick run return 0

data modify storage mlme:temp lk_entry set from storage mlme:engine locks[0]
data modify storage mlme:engine locks append from storage mlme:engine locks[0]
data remove storage mlme:engine locks[0]

scoreboard players add #lk.idx mlme.tick 1
function mlme:core/lock/acquire_iter
