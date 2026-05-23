# Private: not part of MLME public API -- subject to change without notice
data modify storage mlme:cmd Command set from storage mlme:schedule jobs[0].cmd
data remove storage mlme:schedule jobs[0]
function mlme:core/run/setup_marker
function mlme:core/run/cmd