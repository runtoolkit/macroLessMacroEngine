# Private: not part of MLME public API -- subject to change without notice
execute if score #fb.idx mlme.tick >= #fb.size mlme.tick run return 0

data modify storage mlme:temp fb_entry set from storage mlme:engine fibers[0]
data modify storage mlme:temp fb_entry.alive set value 0b
data modify storage mlme:engine fibers append from storage mlme:temp fb_entry
data remove storage mlme:engine fibers[0]
data remove storage mlme:temp fb_entry

scoreboard players add #fb.idx mlme.tick 1
function mlme:core/fiber/kill_iter
