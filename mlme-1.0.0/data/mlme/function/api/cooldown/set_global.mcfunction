# PUBLIC API -- mlme:api/cooldown/set_global
# macroLessMacroEngine v1.0.0
#
# Set a server-wide (non-player) cooldown using a fake player.
# Stored as: #gcd.<name> mlme.cd
#
# Macro-free pattern (in your pack):
#   scoreboard players set #gcd.world_boss mlme.cd 6000
#
# This function sets a named global cooldown from storage:
# Input:
#   mlme:input gcd.name  -- string (stored in mlme:engine for reference only)
#   mlme:input gcd.ticks -- int, cooldown duration
#
# Usage:
#   data modify storage mlme:input gcd.ticks set value 6000
#   function mlme:api/cooldown/set_global
#   (Tick decrement: mlme.cd is already tracked by core/cooldown/tick for @a)
#   (For fake players, decrement manually: scoreboard players remove #gcd.<name> mlme.cd 1)

execute store result score #gcd.val mlme.tick run data get storage mlme:input gcd.ticks
scoreboard players operation #gcd.global mlme.cd = #gcd.val mlme.tick
data remove storage mlme:input gcd
