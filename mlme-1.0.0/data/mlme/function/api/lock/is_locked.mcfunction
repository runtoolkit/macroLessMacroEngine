# PUBLIC API -- mlme:api/lock/is_locked
# macroLessMacroEngine v1.0.0
#
# Check if the global engine has any active lock.
# Returns 1 if any lock is held, 0 if all free.
# Output: mlme:output lock.any_held (1b/0b)
#
# For specific lock by name use scoreboard directly:
#   execute if score #lock.<name> mlme.lock matches 1 run ...

data modify storage mlme:output lock.any_held set value 0b
execute unless data storage mlme:engine locks[0] run return 0
execute store result score #lk.size mlme.tick run data get storage mlme:engine locks
execute if score #lk.size mlme.tick matches 1.. run function mlme:core/lock/check_any
