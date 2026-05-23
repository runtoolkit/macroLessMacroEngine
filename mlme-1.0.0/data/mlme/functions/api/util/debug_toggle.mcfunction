# PUBLIC API -- mlme:api/util/debug_toggle
# macroLessMacroEngine v1.0.0
#
# Toggle MLME debug output on/off.
#
# Usage:
# function mlme:api/util/debug_toggle

data modify storage mlme:temp debug set from storage mlme:config debug
execute if data storage mlme:temp {debug:1b} run data modify storage mlme:config debug set value 0b
execute if data storage mlme:temp {debug:0b} run data modify storage mlme:config debug set value 1b
execute if data storage mlme:config {debug:1b} run tellraw @s {"text":"[MLME] DEBUG: ON","color":"aqua"}
execute if data storage mlme:config {debug:0b} run tellraw @s {"text":"[MLME] DEBUG: OFF","color":"gray"}
data remove storage mlme:temp debug