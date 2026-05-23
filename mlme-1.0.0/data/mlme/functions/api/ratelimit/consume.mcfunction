# PUBLIC API -- mlme:api/ratelimit/consume
# macroLessMacroEngine v1.0.0
#
# Attempt to consume one token from a scoreboard-based bucket.
# Returns 1 (success) if token available, 0 if rate limited.
# Also writes result to mlme:output rl.allowed (1b/0b).
#
# Macro-free pattern: use direct scoreboard commands in your pack.
# Replace <name> with your literal bucket name:
#
# execute if score #rl.<name>.tokens mlme.rl matches 1.. run scoreboard players remove #rl.<name>.tokens mlme.rl 1
# execute if score #rl.<name>.tokens mlme.rl matches 1.. run <your command>
#
# Storage-based bucket (init'd via mlme:api/ratelimit/init):
# Input: mlme:input rl.bucket -- string, must match an init'd bucket

data modify storage mlme:output rl.allowed set value 0b
function mlme:core/ratelimit/consume