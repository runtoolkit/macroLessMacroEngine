# Private: not part of MLME public API -- subject to change without notice
data modify storage mlme:engine state append from storage mlme:engine state[0]
data remove storage mlme:engine state[0]
data remove storage mlme:temp st_entry
