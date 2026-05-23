# PUBLIC API -- mlme:api/batch/clear
# macroLessMacroEngine v1.0.0
#
# Clear all pending commands from the batch staging area without queuing them.
#
# Usage:
#   function mlme:api/batch/clear

data remove storage mlme:batch commands
