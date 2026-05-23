# PUBLIC API -- mlme:api/schedule/clear
# macroLessMacroEngine v1.0.0
#
# Cancel all pending scheduled commands.
#
# Usage:
#   function mlme:api/schedule/clear

data remove storage mlme:schedule jobs
