# Private: not part of MLME public API -- subject to change without notice
execute store result score #ev.size mlme.tick run data get storage mlme:engine events
execute if score #ev.idx mlme.tick >= #ev.size mlme.tick run return 0

data modify storage mlme:temp hook set from storage mlme:engine events[0]
execute if data storage mlme:temp {hook:{event:"player_respawn"}} run function mlme:core/event/fire_hook_join

data modify storage mlme:engine events append from storage mlme:engine events[0]
data remove storage mlme:engine events[0]

scoreboard players add #ev.idx mlme.tick 1
function mlme:core/event/iter_hooks_respawn