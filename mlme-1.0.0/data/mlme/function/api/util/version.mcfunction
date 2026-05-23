# PUBLIC API -- mlme:api/util/version
# macroLessMacroEngine v1.0.0
#
# Display MLME version info to @s.
#
# Usage:
#   function mlme:api/util/version

tellraw @s ["",{"text":"[MLME] ","color":"aqua"},{"text":"macroLessMacroEngine","color":"white"},{"text":" v1.0.0","color":"gold"}]
tellraw @s ["",{"text":"  Pack format: 18-101 (1.19.3 - 1.21.5+)","color":"gray"}]
tellraw @s ["",{"text":"  Macro-free: ","color":"gray"},{"text":"yes","color":"green"}]
tellraw @s ["",{"text":"  LanternLoad: ","color":"gray"},{"text":"integrated","color":"green"}]
tellraw @s ["",{"text":"  Modules: run, queue, batch, schedule, cooldown, event, fiber, state, hook, counter, ratelimit, lock, broadcast, tag, data, perm","color":"dark_gray"}]
