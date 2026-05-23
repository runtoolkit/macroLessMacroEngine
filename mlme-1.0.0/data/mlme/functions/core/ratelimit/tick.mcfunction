# Private: not part of MLME public API -- subject to change without notice
# Decrements refill_in for each bucket; refills tokens when window expires.
execute unless data storage mlme:engine rl_buckets[0] run return 0
execute store result score #rl.size mlme.tick run data get storage mlme:engine rl_buckets
scoreboard players set #rl.idx mlme.tick 0
function mlme:core/ratelimit/tick_iter
