# PUBLIC API -- mlme:api/cooldown/set
# macroLessMacroEngine v1.0.0
#
# Sets a cooldown for the executor (@s).
# Macro-free. Compatible with Minecraft 1.19.3+.
#
# Input:
#   mlme:cd Ticks -- int, number of ticks for the cooldown (20 = 1 second)
#
# Usage:
#   data modify storage mlme:cd Ticks set value 100
#   function mlme:api/cooldown/set

execute store result score @s mlme.cd run data get storage mlme:cd Ticks
data remove storage mlme:cd Ticks
