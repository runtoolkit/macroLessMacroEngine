# Private: not part of MLME public API -- subject to change without notice
execute unless data storage mlme:engine fiber_pending[0] run return 0

execute store result score #fp.size mlme.tick run data get storage mlme:engine fiber_pending
scoreboard players set #fp.idx mlme.tick 0
function mlme:core/fiber/pending_iter