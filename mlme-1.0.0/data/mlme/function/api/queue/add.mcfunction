# PUBLIC API -- mlme:api/queue/add
# macroLessMacroEngine v1.0.0
#
# Add the command stored in mlme:cmd Command to the execution queue.
#
# Usage:
#   data modify storage mlme:cmd Command set value "say First!"
#   function mlme:api/queue/add
#   data modify storage mlme:cmd Command set value "say Second!"
#   function mlme:api/queue/add
#   function mlme:api/queue/run

data modify storage mlme:queue commands append from storage mlme:cmd Command
data remove storage mlme:cmd Command
