# PUBLIC API -- mlme:api/counter/threshold_check
# macroLessMacroEngine v1.0.0
#
# Fire mlme:engine counter.threshold_cmd when a counter hits or exceeds a value.
# Macro-free: only works with #ctr.threshold_watch (single watched counter).
#
# Input:
#   mlme:input counter.name_value -- int, score of the counter to compare
#   mlme:input counter.threshold  -- int, the trigger threshold
#   mlme:input counter.cmd        -- string, command to run when threshold hit
#
# Usage:
#   scoreboard players operation #ctr.watch mlme.ctr = #ctr.kills mlme.ctr
#   data modify storage mlme:input counter.threshold set value 10
#   data modify storage mlme:input counter.cmd set value "function mypack:on_ten_kills"
#   function mlme:api/counter/threshold_check

execute store result score #ctr.watch mlme.ctr run scoreboard players get #ctr.watch mlme.ctr
execute store result score #ctr.thresh mlme.tick run data get storage mlme:input counter.threshold
execute if score #ctr.watch mlme.ctr >= #ctr.thresh mlme.tick run data modify storage mlme:cmd Command set from storage mlme:input counter.cmd
execute if score #ctr.watch mlme.ctr >= #ctr.thresh mlme.tick run function mlme:core/run/cmd
data remove storage mlme:input counter
