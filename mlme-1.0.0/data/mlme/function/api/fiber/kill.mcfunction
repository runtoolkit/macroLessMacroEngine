# PUBLIC API -- mlme:api/fiber/kill
# macroLessMacroEngine v1.0.0
#
# Kill a fiber by stopping further resumes.
#
# MACRO-FREE LIMITATION: Without $(var) interpolation it is impossible to
# match a fiber entry by its runtime ID string within a generic iterator.
# This function clears ALL pending fiber queue entries (fiber_pending + fiber_queue).
# If you need per-ID kill, maintain separate fiber state per-ID in your pack
# using scoreboard flags: scoreboard players set #fiber.<id> mlme.flag 0
# and guard your step functions with:
# execute if score #fiber.<id> mlme.flag matches 0 run return 0
#
# Usage (recommended ID-guarded pattern in your step functions):
# # In your fiber step:
# execute if score #fiber.boss_intro mlme.flag matches 0 run return 0
# # ... step logic ...
#
# This function clears the global fiber queues (nuclear option):
# data modify storage mlme:input fiber.id set value "boss_intro"
# function mlme:api/fiber/kill

data remove storage mlme:engine fiber_pending
data remove storage mlme:engine fiber_queue
data remove storage mlme:input fiber.id