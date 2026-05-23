# Private: not part of MLME public API -- subject to change without notice
# Decrement delay and put back at end of fiber_pending list
execute store result storage mlme:temp fp.delay int 1 run scoreboard players get #fp.delay mlme.tick
data modify storage mlme:engine fiber_pending append from storage mlme:temp fp
data remove storage mlme:engine fiber_pending[0]
data remove storage mlme:temp fp
