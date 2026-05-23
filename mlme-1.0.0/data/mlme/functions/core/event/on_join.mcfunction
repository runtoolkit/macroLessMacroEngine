# Private: not part of MLME public API -- subject to change without notice
# Initialize per-player death tracking scoreboard on first join
execute unless entity @s[scores={mlme.deaths=0..}] run scoreboard players set @s mlme.deaths 0
execute unless entity @s[scores={mlme.deaths_prev=0..}] run scoreboard players set @s mlme.deaths_prev 0

# Fire all hooks registered for "player_join"
execute store result score #ev.size mlme.tick run data get storage mlme:engine events
execute if score #ev.size mlme.tick matches 1.. run function mlme:core/event/fire_join