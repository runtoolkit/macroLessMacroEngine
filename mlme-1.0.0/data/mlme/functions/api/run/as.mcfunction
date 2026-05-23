# PUBLIC API -- mlme:api/run/as
# macroLessMacroEngine v1.0.0
#
# Execute a command stored in mlme:cmd Command as one or more tagged entities.
# Does NOT require Minecraft 1.20.2+ (no macros used).
#
# Usage:
# tag <selector> add mlme.executor
# data modify storage mlme:cmd Command set value "say I am the executor!"
# function mlme:api/run/as
#
# Notes:
# - All entities tagged mlme.executor will execute the command.
# - The mlme.executor tag is removed automatically after execution.
# - The command runs at the executor entity's position (at @s).

function mlme:core/run/as_exec