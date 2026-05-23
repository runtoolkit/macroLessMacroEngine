# Private: not part of MLME public API -- subject to change without notice
# Same limitation as remove_key: runtime string equality not possible without macros.
# Returns the last matching entry's value via rotate scan (best-effort).
# For reliable use: access mlme:engine state.<fixed_key> directly.
execute store result score #st.size mlme.tick run data get storage mlme:engine state
scoreboard players set #st.idx mlme.tick 0
function mlme:core/state/find_iter