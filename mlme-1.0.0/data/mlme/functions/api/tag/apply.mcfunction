# PUBLIC API -- mlme:api/tag/apply
# macroLessMacroEngine v1.0.0
#
# Add mlme.tagged to all entities currently tagged mlme.target.
# Use as a targeting helper before direct tag operations.
#
# Pattern:
#   tag @a[<conditions>] add mlme.target
#   function mlme:api/tag/apply        # marks them as mlme.tagged
#   tag @e[tag=mlme.tagged] add mypack.vip
#   function mlme:api/tag/clear_all

tag @e[tag=mlme.target] add mlme.tagged
