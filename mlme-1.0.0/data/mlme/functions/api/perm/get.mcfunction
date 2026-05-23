# PUBLIC API -- mlme:api/perm/get
# macroLessMacroEngine v1.0.0
#
# Read executor's permission level into storage.
# Output: mlme:output perm.level (int)
#
# Usage:
#   execute as <player> run function mlme:api/perm/get
#   data get storage mlme:output perm.level

execute store result storage mlme:output perm.level int 1 run scoreboard players get @s mlme.perm
