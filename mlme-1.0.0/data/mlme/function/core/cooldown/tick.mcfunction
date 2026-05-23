# Private: not part of MLME public API -- subject to change without notice
# Decrements mlme.cd for all players on cooldown, every tick.
scoreboard players remove @a[scores={mlme.cd=1..}] mlme.cd 1
