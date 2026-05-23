# Private: not part of MLME public API -- subject to change without notice
execute if score #rl.idx mlme.tick >= #rl.size mlme.tick run return 0
data modify storage mlme:temp rl_entry set from storage mlme:engine rl_buckets[0]
# Unconditional refill on all buckets (simple reset, no name filter without macros)
data modify storage mlme:temp rl_entry.tokens    set from storage mlme:temp rl_entry.max_tokens
data modify storage mlme:temp rl_entry.refill_in set from storage mlme:temp rl_entry.window
data modify storage mlme:engine rl_buckets append from storage mlme:temp rl_entry
data remove storage mlme:engine rl_buckets[0]
data remove storage mlme:temp rl_entry
scoreboard players add #rl.idx mlme.tick 1
function mlme:core/ratelimit/reset_iter
