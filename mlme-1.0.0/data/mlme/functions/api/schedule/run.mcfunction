# PUBLIC API -- mlme:api/schedule/run
# macroLessMacroEngine v1.0.0
#
# Schedule a command to run after a delay.
# Does NOT lose @s context -- command block fires at the same location.
#
# Usage:
#   data modify storage mlme:cmd Command set value "say Hello!"
#   data modify storage mlme:cmd Delay set value 40
#   function mlme:api/schedule/run
#
# Delay unit: ticks (20t = 1s)
# Multiple schedules can be pending simultaneously.

function mlme:core/schedule/add
