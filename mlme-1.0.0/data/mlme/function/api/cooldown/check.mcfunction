# PUBLIC API -- mlme:api/cooldown/check
# macroLessMacroEngine v1.0.0
#
# Checks if the executor (@s) is NOT on cooldown.
# Returns 1 (success) if ready, 0 (fail) if still cooling down.
# Also writes result to mlme:output Cooldown.ready (1b = ready, 0b = on cooldown).
#
# Requires: Minecraft 1.20.2+ (return command)
# For 1.19.x, read mlme:output Cooldown.ready after calling.
#
# Usage:
# execute as <player> if function mlme:api/cooldown/check run ...

data modify storage mlme:output Cooldown.ready set value 0b
execute if score @s mlme.cd matches 0 run data modify storage mlme:output Cooldown.ready set value 1b
execute if score @s mlme.cd matches 0 run return 1
return 0