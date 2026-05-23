# Private: not part of MLME public API -- subject to change without notice
# Run mlme:cmd Command as all entities currently tagged mlme.executor.
# The mlme.executor tag is removed from all entities after execution.

function mlme:core/run/setup_marker

setblock 0 -64 0 minecraft:command_block replace
data modify block 0 -64 0 Command set value ""
data modify block 0 -64 0 auto set value 0b
data modify block 0 -64 0 TrackOutput set value 1b

execute at @e[type=minecraft:marker,tag=mlme.cmd,limit=1] run data modify block 0 -64 0 Command set from storage mlme:cmd Command

execute as @e[tag=mlme.executor] at @s run data modify block 0 -64 0 auto set value 1b

tag @e remove mlme.executor
data remove storage mlme:cmd Command

schedule function mlme:core/run/reset 3t replace