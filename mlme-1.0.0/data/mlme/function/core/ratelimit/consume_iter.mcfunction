# Private: not part of MLME public API -- subject to change without notice
execute if score #rl.idx mlme.tick >= #rl.size mlme.tick run return 0

data modify storage mlme:temp rl_entry set from storage mlme:engine rl_buckets[0]

# Check bucket name match via compound probe
data modify storage mlme:temp rl_probe set value {bucket:""}
data modify storage mlme:temp rl_probe.bucket set from storage mlme:input rl.bucket

# Rotate to iterate
data modify storage mlme:engine rl_buckets append from storage mlme:engine rl_buckets[0]
data remove storage mlme:engine rl_buckets[0]

scoreboard players add #rl.idx mlme.tick 1
function mlme:core/ratelimit/consume_iter
