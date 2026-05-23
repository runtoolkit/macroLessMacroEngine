# PUBLIC API -- mlme:api/util/reset_all
# macroLessMacroEngine v1.0.0
#
# Full MLME engine reset. Clears all runtime state.
# Use with caution -- discards all queued commands, schedules, fibers, etc.
#
# Usage:
# function mlme:api/util/reset_all

# Queue
data remove storage mlme:queue commands
schedule clear mlme:core/queue/tick

# Schedule
data remove storage mlme:schedule jobs
data remove storage mlme:engine repeating

# Fibers
data remove storage mlme:engine fibers
data remove storage mlme:engine fiber_pending
data remove storage mlme:engine fiber_queue

# Events / hooks
data remove storage mlme:engine events

# State
data remove storage mlme:engine state

# Rate limiters / locks
data remove storage mlme:engine rl_buckets
data remove storage mlme:engine locks

# Cmd
data remove storage mlme:cmd Command
data remove storage mlme:cmd Delay

# Cancel active command block
schedule clear mlme:core/run/reset
execute if entity @e[type=minecraft:marker,tag=mlme.cmd,limit=1] run data modify block 0 -64 0 auto set value 0b
execute if entity @e[type=minecraft:marker,tag=mlme.cmd,limit=1] run setblock 0 -64 0 minecraft:air replace
kill @e[type=minecraft:marker,tag=mlme.cmd]

# Scoreboard resets (keep objectives, reset runtime values)
scoreboard players reset #mce.size mlme.queue
scoreboard players set #gcd.global mlme.cd 0

tellraw @s ["",{"text":"[MLME] ","color":"aqua"},{"text":"Engine reset complete.","color":"yellow"}]