# Private: not part of MLME public API -- subject to change without notice
execute as @a[tag=mlme.debug_caller] run tellraw @s [{"text":"[MLME] CMD: ","color":"aqua"},{"storage":"mlme:cmd","nbt":"Command","color":"yellow"}]
execute as @a[tag=mlme.debug_caller] run tellraw @s [{"text":"[MLME] OUT: ","color":"aqua"},{"block":"0 -64 0","nbt":"LastOutput","interpret":true}]
tag @a remove mlme.debug_caller