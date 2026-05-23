# Private: not part of MLME public API -- subject to change without notice
# Reset tokens to max_tokens and refill_in to window
data modify storage mlme:temp rl_entry.tokens    set from storage mlme:temp rl_entry.max_tokens
data modify storage mlme:temp rl_entry.refill_in set from storage mlme:temp rl_entry.window
