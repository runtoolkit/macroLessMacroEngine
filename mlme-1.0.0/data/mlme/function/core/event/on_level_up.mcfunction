# Private: not part of MLME public API -- subject to change without notice
# Called when a player gains an XP level (detected via scoreboard stat delta).
scoreboard players set #ev.idx mlme.tick 0
function mlme:core/event/iter_hooks_levelup
