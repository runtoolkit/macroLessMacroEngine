# PUBLIC API -- mlme:api/perm/grant
# macroLessMacroEngine v1.0.0
#
# Grant a permission level to the executor (@s).
# Levels are integers; convention: 0=none, 1=user, 2=mod, 3=admin.
#
# Input:
#   mlme:input perm.level -- int, permission level to grant
#
# Usage:
#   data modify storage mlme:input perm.level set value 2
#   execute as <player> run function mlme:api/perm/grant

execute store result score @s mlme.perm run data get storage mlme:input perm.level
data remove storage mlme:input perm.level
