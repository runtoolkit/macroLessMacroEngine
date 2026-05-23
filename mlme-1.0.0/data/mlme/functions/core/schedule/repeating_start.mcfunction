# Private: not part of MLME public API -- subject to change without notice
# Queue the first run of the repeating task
data modify storage mlme:cmd Command set from storage mlme:engine repeating[-1].cmd
data modify storage mlme:cmd Delay   set from storage mlme:engine repeating[-1].interval
function mlme:core/schedule/add
