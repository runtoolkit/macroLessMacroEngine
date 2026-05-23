# PUBLIC API -- mlme:api/data/incr
# macroLessMacroEngine v1.0.0
#
# Increment an integer value in mlme:data by a scoreboard amount.
#
# Input:
#   mlme:input data.amount -- int, amount to add
#
# Usage:
#   data modify storage mlme:input data.amount set value 1
#   function mlme:api/data/incr
#   (then read back: data get storage mlme:data mypack.counter)
#
# Note: uses mlme.tick scoreboard as intermediary.
# Inline equivalent (faster):
#   execute store result score #tmp mlme.tick run data get storage mlme:data mypack.counter
#   scoreboard players add #tmp mlme.tick 5
#   execute store result storage mlme:data mypack.counter int 1 run scoreboard players get #tmp mlme.tick

execute store result score #dt.val mlme.tick run data get storage mlme:input data.source
execute store result score #dt.amt mlme.tick run data get storage mlme:input data.amount
scoreboard players operation #dt.val mlme.tick += #dt.amt mlme.tick
execute store result storage mlme:output data.result int 1 run scoreboard players get #dt.val mlme.tick
data remove storage mlme:input data
