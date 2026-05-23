# PUBLIC API -- mlme:api/queue/run
# macroLessMacroEngine v1.0.0
#
# Start executing all commands in the queue (one per 3 ticks).
#
# Usage:
# function mlme:api/queue/run

execute store result score #mce.size mlme.queue run data get storage mlme:queue commands
execute if score #mce.size mlme.queue matches 1.. run function mlme:core/queue/tick