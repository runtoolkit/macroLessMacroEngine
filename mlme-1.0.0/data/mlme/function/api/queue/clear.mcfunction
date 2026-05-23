# PUBLIC API -- mlme:api/queue/clear
# macroLessMacroEngine v1.0.0
#
# Clear all pending commands from the queue without executing them.
#
# Usage:
#   function mlme:api/queue/clear

data remove storage mlme:queue commands
schedule clear mlme:core/queue/tick
