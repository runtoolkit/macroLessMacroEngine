# PUBLIC API -- mlme:api/ratelimit/reset
# macroLessMacroEngine v1.0.0
#
# Immediately refill all tokens for a bucket (bypass rate limit).
# For direct scoreboard usage:
# scoreboard players set #rl.<name>.tokens mlme.rl <max>
#
# Storage-based buckets: sets tokens = max_tokens for the matching bucket.
# Input: mlme:input rl.bucket -- string

function mlme:core/ratelimit/reset
data remove storage mlme:input rl