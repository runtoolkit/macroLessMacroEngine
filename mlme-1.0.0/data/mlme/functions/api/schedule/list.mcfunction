# PUBLIC API -- mlme:api/schedule/list
# macroLessMacroEngine v1.0.0
#
# Display all pending scheduled jobs to @s (debug use).
#
# Usage:
# function mlme:api/schedule/list

execute store result score #sc.count mlme.tick run data get storage mlme:schedule jobs
tellraw @s ["",{"text":"[MLME] Scheduled jobs: ","color":"aqua"},{"score":{"name":"#sc.count","objective":"mlme.tick"},"color":"yellow"}]
tellraw @s ["",{"text":"[MLME] Jobs: ","color":"gray"},{"storage":"mlme:schedule","nbt":"jobs","color":"white"}]
execute store result score #sc.count mlme.tick run data get storage mlme:engine repeating
tellraw @s ["",{"text":"[MLME] Repeating: ","color":"gray"},{"score":{"name":"#sc.count","objective":"mlme.tick"},"color":"yellow"}]