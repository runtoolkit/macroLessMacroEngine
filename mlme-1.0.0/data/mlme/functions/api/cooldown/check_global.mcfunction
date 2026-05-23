# PUBLIC API -- mlme:api/cooldown/check_global
# macroLessMacroEngine v1.0.0
#
# Check if the global cooldown is expired.
# Returns 1 if ready, 0 if still cooling.
# Output: mlme:output gcd.ready (1b/0b)
#
# Macro-free pattern:
# execute if score #gcd.world_boss mlme.cd matches 0 run ...
#
# This function checks #gcd.global:
# function mlme:api/cooldown/check_global
# execute if data storage mlme:output {gcd:{ready:1b}} run ...

data modify storage mlme:output gcd.ready set value 0b
execute if score #gcd.global mlme.cd matches ..0 run data modify storage mlme:output gcd.ready set value 1b
execute if score #gcd.global mlme.cd matches ..0 run return 1
return 0