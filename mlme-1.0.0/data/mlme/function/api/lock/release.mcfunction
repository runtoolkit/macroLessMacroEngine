# PUBLIC API -- mlme:api/lock/release
# macroLessMacroEngine v1.0.0
#
# Release a named lock.
#
# Macro-free pattern:
# scoreboard players set #lock.<name> mlme.lock 0
#
# Storage-based:
# data modify storage mlme:input lock.name set value "my_lock"
# function mlme:api/lock/release

function mlme:core/lock/release
data remove storage mlme:input lock.name