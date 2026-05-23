# PUBLIC API -- mlme:api/event/register
# macroLessMacroEngine v1.0.0
#
# Register a command hook for a named event.
# Supported events: "player_join", "player_death"
#
# Input:
#   mlme:input event  -- string, event name
#   mlme:input cmd    -- string, command to run when event fires
#
# Usage:
#   data modify storage mlme:input event set value "player_join"
#   data modify storage mlme:input cmd   set value "say Welcome!"
#   function mlme:api/event/register

data modify storage mlme:engine events append value {event:"",cmd:""}
data modify storage mlme:engine events[-1].event set from storage mlme:input event
data modify storage mlme:engine events[-1].cmd   set from storage mlme:input cmd
data remove storage mlme:input event
data remove storage mlme:input cmd
