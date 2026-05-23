# Private: not part of MLME public API -- subject to change without notice
execute store result storage mlme:schedule jobs[0].ticks int 1 run scoreboard players get #sched.ticks mlme.tick
data modify storage mlme:schedule jobs append from storage mlme:schedule jobs[0]
data remove storage mlme:schedule jobs[0]
