# Private: not part of MLME public API -- subject to change without notice
execute store result score #mce.size mlme.queue run data get storage mlme:queue commands

execute if score #mce.size mlme.queue matches 0 run return 0
execute unless data storage mlme:queue commands[0] run return 0

data modify storage mlme:cmd Command set from storage mlme:queue commands[0]
data remove storage mlme:queue commands[0]

function mlme:core/run/cmd

execute store result score #mce.size mlme.queue run data get storage mlme:queue commands
execute if score #mce.size mlme.queue matches 1.. run schedule function mlme:core/queue/tick 3t replace
