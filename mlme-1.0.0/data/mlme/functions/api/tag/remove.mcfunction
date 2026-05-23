# PUBLIC API -- mlme:api/tag/remove
# macroLessMacroEngine v1.0.0
#
# Remove a tag from all entities tagged mlme.target.
#
# Macro-free pattern (preferred):
# tag @a[tag=mypack.vip] remove mypack.vip
#
# mlme.target pattern:
# tag <selector> add mlme.target
# function mlme:api/tag/remove (removes mlme.tagged from mlme.target entities)

data modify storage mlme:cmd Command set value "tag @e[tag=mlme.target] remove mlme.tagged"
function mlme:core/run/setup_marker
function mlme:core/run/cmd
tag @e remove mlme.target