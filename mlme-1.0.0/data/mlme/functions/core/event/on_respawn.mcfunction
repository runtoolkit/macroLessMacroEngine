# Private: not part of MLME public API -- subject to change without notice
# Called from advancement trigger when a player respawns.
execute store result score #ev.size mlme.tick run data get storage mlme:engine events
execute if score #ev.size mlme.tick matches 1.. run function mlme:core/event/fire_respawn
