# PUBLIC API -- mlme:api/hook/bind
# macroLessMacroEngine v1.0.0
#
# Alias for mlme:api/event/register -- matches AME-style API surface.
#
# Input:
#   mlme:input event  -- string, event name
#   mlme:input cmd    -- string, command to execute when event fires
#
# Usage:
#   data modify storage mlme:input event set value "player_join"
#   data modify storage mlme:input cmd   set value "say Welcome!"
#   function mlme:api/hook/bind

function mlme:api/event/register
