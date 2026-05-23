# Private: not part of MLME public API -- subject to change without notice
# Iterate over mlme:engine events and fire entries where event == "player_join"
# Uses schedule-based iteration via index scoreboard counter (no macros)
scoreboard players set #ev.idx mlme.tick 0
function mlme:core/event/iter_hooks_join
