# Private: not part of MLME public API -- subject to change without notice
execute if score #rl.idx mlme.tick >= #rl.size mlme.tick run return 0

data modify storage mlme:temp rl_entry set from storage mlme:engine rl_buckets[0]

execute store result score #rl.refill mlme.tick run data get storage mlme:temp rl_entry.refill_in
scoreboard players remove #rl.refill mlme.tick 1

# Refill if window expired
execute if score #rl.refill mlme.tick matches ..0 run function mlme:core/ratelimit/refill

# Update refill_in in storage
execute store result storage mlme:temp rl_entry.refill_in int 1 run scoreboard players get #rl.refill mlme.tick
data modify storage mlme:engine rl_buckets append from storage mlme:temp rl_entry
data remove storage mlme:engine rl_buckets[0]
data remove storage mlme:temp rl_entry

scoreboard players add #rl.idx mlme.tick 1
function mlme:core/ratelimit/tick_iter
