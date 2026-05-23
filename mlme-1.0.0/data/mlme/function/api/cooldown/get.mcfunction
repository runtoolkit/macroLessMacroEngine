# PUBLIC API -- mlme:api/cooldown/get
# macroLessMacroEngine v1.0.0
#
# Reads the remaining cooldown ticks for @s into storage.
# Output: mlme:output Cooldown.remaining (int, remaining ticks)
#
# Usage:
# execute as <player> run function mlme:api/cooldown/get
# data get storage mlme:output Cooldown.remaining

execute store result storage mlme:output Cooldown.remaining int 1 run scoreboard players get @s mlme.cd