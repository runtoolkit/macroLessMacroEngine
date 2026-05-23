# Private: not part of MLME public API -- subject to change without notice
# Fires registered event hooks each tick.
# Currently supported: player_join (tag mlme.online), player_death (deaths scoreboard)

# - player_join detection -
# New players: online but not yet tagged
execute as @a[tag=!mlme.online] run function mlme:core/event/on_join
# Mark all online players
tag @a add mlme.online
# Remove tag from players who left (offline players retain tag until next tick they're seen)

# - player_death detection -
# Uses a secondary scoreboard that tracks "seen death" flag per player.
# When minecraft.custom:minecraft.deaths increases, fire death hooks.
# NOTE: This requires the mlme.deaths_prev objective (set on join / last tick).
execute as @a if score @s mlme.deaths > @s mlme.deaths_prev run function mlme:core/event/on_death
execute as @a run scoreboard players operation @s mlme.deaths_prev = @s mlme.deaths