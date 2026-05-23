# PUBLIC API -- mlme:api/broadcast/actionbar
# macroLessMacroEngine v1.0.0
#
# Show an actionbar message to all players.
#
# Input:
#   mlme:input broadcast.text -- string, actionbar text
#
# Usage:
#   data modify storage mlme:input broadcast.text set value "Game starts in 10 seconds!"
#   function mlme:api/broadcast/actionbar

title @a actionbar ["",{"storage":"mlme:input","nbt":"broadcast.text"}]
data remove storage mlme:input broadcast.text
