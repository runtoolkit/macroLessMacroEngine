# Private: not part of MLME public API -- subject to change without notice
data modify storage mlme:cmd Command set from storage mlme:temp hook.cmd
execute if data storage mlme:temp {hook:{type:"func"}} run function mlme:core/run/cmd
execute unless data storage mlme:temp {hook:{type:"func"}} run function mlme:core/run/cmd
data remove storage mlme:temp hook