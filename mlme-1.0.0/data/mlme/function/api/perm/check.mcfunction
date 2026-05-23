# PUBLIC API -- mlme:api/perm/check
# macroLessMacroEngine v1.0.0
#
# Check if executor (@s) has at least the required permission level.
# Returns 1 if permitted, 0 if not.
# Also writes mlme:output perm.ok (1b/0b).
#
# Input:
#   mlme:input perm.required -- int, minimum required level
#
# Usage:
#   data modify storage mlme:input perm.required set value 2
#   execute as <player> if function mlme:api/perm/check run function mypack:mod_action
#
# Inline pattern (faster):
#   execute as <player> if score @s mlme.perm matches 2.. run function mypack:mod_action

data modify storage mlme:output perm.ok set value 0b
execute store result score #pm.req mlme.tick run data get storage mlme:input perm.required
execute if score @s mlme.perm >= #pm.req mlme.tick run data modify storage mlme:output perm.ok set value 1b
execute if score @s mlme.perm >= #pm.req mlme.tick run return 1
data remove storage mlme:input perm.required
return 0
