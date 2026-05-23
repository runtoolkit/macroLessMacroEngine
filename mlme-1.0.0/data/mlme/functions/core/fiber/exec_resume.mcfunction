# Private: not part of MLME public API -- subject to change without notice
data modify storage mlme:cmd Command set from storage mlme:temp fiber_item.resume_cmd
function mlme:core/run/cmd
data remove storage mlme:temp fiber_item
