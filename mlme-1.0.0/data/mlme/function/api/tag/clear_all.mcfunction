# PUBLIC API -- mlme:api/tag/clear_all
# macroLessMacroEngine v1.0.0
#
# Remove mlme.target and mlme.tagged helper tags from all entities.
# Call after any mlme tag operation to clean up.
#
# Usage:
#   function mlme:api/tag/clear_all

tag @e remove mlme.target
tag @e remove mlme.tagged
