# PUBLIC API -- mlme:api/perm/require
# macroLessMacroEngine v1.0.0
#
# Gate: return 0 (abort caller) if @s lacks the required level.
# Designed to be called at the top of protected functions.
#
# Input:
# mlme:input perm.required -- int
#
# Usage:
# data modify storage mlme:input perm.required set value 3
# execute as <player> run function mlme:api/perm/require
# # continues only if player has perm >= 3

execute store result score #pm.req mlme.tick run data get storage mlme:input perm.required
data remove storage mlme:input perm.required
execute unless score @s mlme.perm >= #pm.req mlme.tick run return 0