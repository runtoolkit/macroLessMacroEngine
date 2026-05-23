# Private: not part of MLME public API -- subject to change without notice
execute unless data storage mlme:engine locks[0] run return 0
execute store result score #lk.size mlme.tick run data get storage mlme:engine locks
scoreboard players set #lk.idx mlme.tick 0
function mlme:core/lock/release_iter
