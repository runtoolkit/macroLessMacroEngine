# PUBLIC API -- mlme:api/batch/run
# macroLessMacroEngine v1.0.0
#
# Add all commands in mlme:batch commands list to queue and run them.
#
# Usage:
# data modify storage mlme:batch commands set value ["say 1","say 2","say 3"]
# function mlme:api/batch/run

function mlme:core/batch/run