# Private: not part of MLME public API -- subject to change without notice
# Detect player level-up via scoreboard stat delta
execute as @a if score @s mlme.levels > @s mlme.levels_prev run function mlme:core/event/on_level_up
execute as @a run scoreboard players operation @s mlme.levels_prev = @s mlme.levels
