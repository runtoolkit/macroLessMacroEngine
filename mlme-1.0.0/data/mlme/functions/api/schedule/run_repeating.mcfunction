# PUBLIC API -- mlme:api/schedule/run_repeating
# macroLessMacroEngine v1.0.0
#
# Schedule a command to run repeatedly at a fixed interval.
# The command re-schedules itself each time it fires.
#
# Input:
#   mlme:input repeat.cmd      -- string, command to run each interval
#   mlme:input repeat.interval -- int, interval in ticks
#   mlme:input repeat.id       -- string, unique ID (used to cancel)
#
# Usage:
#   data modify storage mlme:input repeat.cmd      set value "function mypack:every_second"
#   data modify storage mlme:input repeat.interval set value 20
#   data modify storage mlme:input repeat.id       set value "mypack_heartbeat"
#   function mlme:api/schedule/run_repeating

data modify storage mlme:engine repeating append value {id:"",cmd:"",interval:0,active:1b}
data modify storage mlme:engine repeating[-1].id       set from storage mlme:input repeat.id
data modify storage mlme:engine repeating[-1].cmd      set from storage mlme:input repeat.cmd
data modify storage mlme:engine repeating[-1].interval set from storage mlme:input repeat.interval

function mlme:core/schedule/repeating_start
data remove storage mlme:input repeat
