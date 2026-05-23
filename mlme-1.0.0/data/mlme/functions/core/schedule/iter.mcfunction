# Private: not part of MLME public API -- subject to change without notice
execute if score #sched.size mlme.tick matches ..0 run return 0

execute store result score #sched.ticks mlme.tick run data get storage mlme:schedule jobs[0].ticks
scoreboard players remove #sched.ticks mlme.tick 1

execute if score #sched.ticks mlme.tick matches ..0 run function mlme:core/schedule/fire_iter
execute if score #sched.ticks mlme.tick matches 1.. run function mlme:core/schedule/defer_iter

scoreboard players remove #sched.size mlme.tick 1
function mlme:core/schedule/iter