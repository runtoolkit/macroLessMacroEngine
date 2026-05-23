# Private: not part of MLME public API -- subject to change without notice
execute if score #lk.size mlme.tick matches ..0 run return 0
data modify storage mlme:temp lk_check set from storage mlme:engine locks[0]
execute if data storage mlme:temp {lk_check:{held:1b}} run data modify storage mlme:output lock.any_held set value 1b
execute if data storage mlme:temp {lk_check:{held:1b}} run return 1
data modify storage mlme:engine locks append from storage mlme:engine locks[0]
data remove storage mlme:engine locks[0]
scoreboard players remove #lk.size mlme.tick 1
data remove storage mlme:temp lk_check
function mlme:core/lock/check_any