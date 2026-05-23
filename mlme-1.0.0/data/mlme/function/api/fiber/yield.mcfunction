# PUBLIC API -- mlme:api/fiber/yield
# macroLessMacroEngine v1.0.0
#
# Yield current fiber: schedule the next step after a delay.
# Call this from within a fiber step function.
#
# Input:
#   mlme:input fiber.id         -- string, fiber ID
#   mlme:input fiber.resume_cmd -- string, function/command for next step
#   mlme:input fiber.delay      -- int, delay in ticks before next step
#
# Usage:
#   data modify storage mlme:input fiber.id         set value "boss_intro"
#   data modify storage mlme:input fiber.resume_cmd set value "function mypack:boss/step1"
#   data modify storage mlme:input fiber.delay      set value 100
#   function mlme:api/fiber/yield

# Queue the next step in fiber_pending
data modify storage mlme:engine fiber_pending append value {id:"",alive:1b,resume_cmd:"",delay:0}
data modify storage mlme:engine fiber_pending[-1].id         set from storage mlme:input fiber.id
data modify storage mlme:engine fiber_pending[-1].resume_cmd set from storage mlme:input fiber.resume_cmd
data modify storage mlme:engine fiber_pending[-1].delay      set from storage mlme:input fiber.delay

data remove storage mlme:input fiber
