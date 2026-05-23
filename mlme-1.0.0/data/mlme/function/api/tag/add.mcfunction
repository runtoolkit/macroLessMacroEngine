# PUBLIC API -- mlme:api/tag/add
# macroLessMacroEngine v1.0.0
#
# Add a tag to all entities tagged mlme.target.
# Without macros, tag names must be literal in your callsite.
#
# Macro-free pattern (in your pack):
#   tag @a[<conditions>] add mypack.vip
#
# mlme.target pattern:
#   tag <selector> add mlme.target
#   data modify storage mlme:input tag.name set value "mypack.vip"
#   function mlme:api/tag/add

function mlme:core/tag/apply_add
data remove storage mlme:input tag.name
