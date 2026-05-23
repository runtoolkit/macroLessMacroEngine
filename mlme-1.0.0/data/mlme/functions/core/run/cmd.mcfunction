# Private: not part of MLME public API -- subject to change without notice
function mlme:core/run/setup_marker

execute if data storage mlme:config {debug:1b} run tag @s add mlme.debug_caller

setblock 0 -64 0 minecraft:command_block replace
data modify block 0 -64 0 Command set value ""
data modify block 0 -64 0 auto set value 0b
data modify block 0 -64 0 TrackOutput set value 1b

execute at @e[type=minecraft:marker,tag=mlme.cmd,limit=1] run data modify block 0 -64 0 Command set from storage mlme:cmd Command
execute at @e[type=minecraft:marker,tag=mlme.cmd,limit=1] run data modify block 0 -64 0 auto set value 1b

execute if data storage mlme:config {debug:1b} run schedule function mlme:core/debug/output 2t replace

schedule function mlme:core/run/reset 3t replace
