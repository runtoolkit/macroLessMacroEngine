# PUBLIC API -- mlme:api/broadcast/title
# macroLessMacroEngine v1.0.0
#
# Show a title + subtitle to all players from storage.
#
# Input:
#   mlme:input broadcast.title    -- string, title text
#   mlme:input broadcast.subtitle -- string, subtitle text (optional)
#   mlme:input broadcast.fadein   -- int, fade-in ticks (default 10)
#   mlme:input broadcast.stay     -- int, stay ticks (default 70)
#   mlme:input broadcast.fadeout  -- int, fade-out ticks (default 20)
#
# Usage:
#   data modify storage mlme:input broadcast.title    set value "Round Over"
#   data modify storage mlme:input broadcast.subtitle set value "Blue team wins!"
#   data modify storage mlme:input broadcast.fadein   set value 10
#   data modify storage mlme:input broadcast.stay     set value 70
#   data modify storage mlme:input broadcast.fadeout  set value 20
#   function mlme:api/broadcast/title

function mlme:core/broadcast/title
data remove storage mlme:input broadcast
