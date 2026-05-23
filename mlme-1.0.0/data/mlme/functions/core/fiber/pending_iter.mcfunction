# Private: not part of MLME public API -- subject to change without notice
execute if score #fp.idx mlme.tick >= #fp.size mlme.tick run return 0

data modify storage mlme:temp fp set from storage mlme:engine fiber_pending[0]

# Decrement delay
execute store result score #fp.delay mlme.tick run data get storage mlme:temp fp.delay
scoreboard players remove #fp.delay mlme.tick 1

# If delay <= 0: move to fiber_queue for execution
execute if score #fp.delay mlme.tick matches ..0 run function mlme:core/fiber/promote_ready
execute if score #fp.delay mlme.tick matches 1.. run function mlme:core/fiber/requeue_pending

scoreboard players add #fp.idx mlme.tick 1
function mlme:core/fiber/pending_iter