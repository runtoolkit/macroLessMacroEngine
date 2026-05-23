# Private: not part of MLME public API -- subject to change without notice
# Decrement global cooldown fake player each tick (if > 0).
execute if score #gcd.global mlme.cd matches 1.. run scoreboard players remove #gcd.global mlme.cd 1
