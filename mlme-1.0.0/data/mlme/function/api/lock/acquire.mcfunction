# PUBLIC API -- mlme:api/lock/acquire
# macroLessMacroEngine v1.0.0
#
# Acquire a named mutex lock. Returns 1 if acquired, 0 if already held.
# Also writes result to mlme:output lock.acquired (1b/0b).
#
# Macro-free pattern (preferred for performance):
# execute if score #lock.<name> mlme.lock matches 0 run scoreboard players set #lock.<name> mlme.lock 1
# execute if score #lock.<name> mlme.lock matches 1 run <protected code>
#
# Storage-based usage (tracks owner entity):
# data modify storage mlme:input lock.name set value "my_lock"
# function mlme:api/lock/acquire
# execute if data storage mlme:output {lock:{acquired:1b}} run function mypack:critical_section

data modify storage mlme:output lock.acquired set value 0b
function mlme:core/lock/acquire
data remove storage mlme:input lock.name