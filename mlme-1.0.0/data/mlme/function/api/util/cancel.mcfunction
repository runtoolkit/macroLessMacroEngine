# PUBLIC API -- mlme:api/util/cancel
# macroLessMacroEngine v1.0.0
#
# Cancel any in-progress single command execution.
# Does NOT affect the queue -- use mlme:api/queue/clear for that.
#
# Usage:
#   function mlme:api/util/cancel

schedule clear mlme:core/run/reset

execute if entity @e[type=minecraft:marker,tag=mlme.cmd,limit=1] run data modify block 0 -64 0 auto set value 0b
execute if entity @e[type=minecraft:marker,tag=mlme.cmd,limit=1] run setblock 0 -64 0 minecraft:air replace

kill @e[type=minecraft:marker,tag=mlme.cmd]

data remove storage mlme:cmd Command
data remove storage mlme:cmd Executor
