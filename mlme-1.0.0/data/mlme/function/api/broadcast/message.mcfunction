# PUBLIC API -- mlme:api/broadcast/message
# macroLessMacroEngine v1.0.0
#
# Send a chat message to all players from storage.
#
# Input:
# mlme:input broadcast.text -- string, message text
#
# Usage:
# data modify storage mlme:input broadcast.text set value "Welcome to the server!"
# function mlme:api/broadcast/message

tellraw @a ["",{"storage":"mlme:input","nbt":"broadcast.text"}]
data remove storage mlme:input broadcast.text