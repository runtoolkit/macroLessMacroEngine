# PUBLIC API -- mlme:api/cooldown/clear
# macroLessMacroEngine v1.0.0
#
# Clears the cooldown for the executor (@s) immediately.
#
# Usage:
#   execute as <player> run function mlme:api/cooldown/clear

scoreboard players set @s mlme.cd 0
