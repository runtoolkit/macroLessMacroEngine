# PUBLIC API -- mlme:api/counter/add
# macroLessMacroEngine v1.0.0
#
# Add an arbitrary amount to a named counter.
# Reads amount from storage, applies to #ctr.active fake player.
#
# Input:
#   mlme:input counter.amount -- int, amount to add (can be negative)
#
# Usage:
#   data modify storage mlme:input counter.amount set value 5
#   function mlme:api/counter/add
#   (then read: execute store result ... run scoreboard players get #ctr.active mlme.ctr)
#
# Set the counter before calling:
#   scoreboard players operation #ctr.active mlme.ctr = #ctr.kills mlme.ctr
#   data modify storage mlme:input counter.amount set value 1
#   function mlme:api/counter/add
#   scoreboard players operation #ctr.kills mlme.ctr = #ctr.active mlme.ctr

execute store result score #ctr.amt mlme.ctr run data get storage mlme:input counter.amount
scoreboard players operation #ctr.active mlme.ctr += #ctr.amt mlme.ctr
execute store result storage mlme:output counter.value int 1 run scoreboard players get #ctr.active mlme.ctr
data remove storage mlme:input counter.amount
