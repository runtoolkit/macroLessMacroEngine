# Private: not part of MLME public API -- subject to change without notice

# Guard: require Delay >= 1
execute store result score #sched.delay mlme.tick run data get storage mlme:cmd Delay
execute if score #sched.delay mlme.tick matches ..0 run return 1

data modify storage mlme:schedule jobs append value {cmd:"",ticks:0}
data modify storage mlme:schedule jobs[-1].cmd set from storage mlme:cmd Command
data modify storage mlme:schedule jobs[-1].ticks set from storage mlme:cmd Delay
data remove storage mlme:cmd Command
data remove storage mlme:cmd Delay
