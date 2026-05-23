# Private: not part of MLME public API -- subject to change without notice
execute store result score #lk.size mlme.tick run data get storage mlme:engine locks
scoreboard players set #lk.idx mlme.tick 0
function mlme:core/lock/acquire_iter