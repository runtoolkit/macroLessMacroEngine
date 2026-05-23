# Private: not part of MLME public API -- subject to change without notice
execute unless data storage mlme:schedule jobs[0] run return 0
execute store result score #sched.size mlme.tick run data get storage mlme:schedule jobs
function mlme:core/schedule/iter