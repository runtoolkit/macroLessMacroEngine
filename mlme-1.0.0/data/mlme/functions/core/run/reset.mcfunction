# Private: not part of MLME public API -- subject to change without notice
data modify block 0 -64 0 auto set value 0b
setblock 0 -64 0 minecraft:air replace
kill @e[type=minecraft:marker,tag=mlme.cmd,limit=1]
data remove storage mlme:cmd Command
schedule clear mlme:core/run/reset