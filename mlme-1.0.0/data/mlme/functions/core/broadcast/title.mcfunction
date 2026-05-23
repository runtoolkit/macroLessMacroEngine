# Private: not part of MLME public API -- subject to change without notice
execute store result score #bc.fi mlme.tick run data get storage mlme:input broadcast.fadein
execute store result score #bc.st mlme.tick run data get storage mlme:input broadcast.stay
execute store result score #bc.fo mlme.tick run data get storage mlme:input broadcast.fadeout

# Default values if not set (0 means use minecraft default)
execute if score #bc.fi mlme.tick matches 0 run scoreboard players set #bc.fi mlme.tick 10
execute if score #bc.st mlme.tick matches 0 run scoreboard players set #bc.st mlme.tick 70
execute if score #bc.fo mlme.tick matches 0 run scoreboard players set #bc.fo mlme.tick 20

# Times cannot be set dynamically without macros -- use fixed defaults
title @a times 10 70 20
title @a title ["",{"storage":"mlme:input","nbt":"broadcast.title"}]
title @a subtitle ["",{"storage":"mlme:input","nbt":"broadcast.subtitle"}]
