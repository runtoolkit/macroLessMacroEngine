# PUBLIC API -- mlme:api/fiber/spawn
# macroLessMacroEngine v1.0.0
#
# Spawn a new fiber: runs the given command immediately as step 0,
# and registers it in mlme:engine fibers list.
#
# Input:
#   mlme:input fiber.id         -- string, unique fiber ID
#   mlme:input fiber.resume_cmd -- string, command to run now (step 0)
#
# Usage:
#   data modify storage mlme:input fiber.id         set value "boss_intro"
#   data modify storage mlme:input fiber.resume_cmd set value "function mypack:boss/step0"
#   function mlme:api/fiber/spawn

# Register fiber as alive
data modify storage mlme:engine fibers append value {id:"",alive:1b,resume_cmd:""}
data modify storage mlme:engine fibers[-1].id         set from storage mlme:input fiber.id
data modify storage mlme:engine fibers[-1].resume_cmd set from storage mlme:input fiber.resume_cmd

# Run step 0 immediately
data modify storage mlme:cmd Command set from storage mlme:input fiber.resume_cmd
function mlme:core/run/cmd

data remove storage mlme:input fiber
