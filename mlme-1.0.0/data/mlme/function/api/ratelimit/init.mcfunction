# PUBLIC API -- mlme:api/ratelimit/init
# macroLessMacroEngine v1.0.0
#
# Initialize a rate limiter bucket.
# Call once at load time for each limiter you need.
#
# Macro-free: bucket names must be literal in your callsite.
# Internally uses two fake players per bucket:
# #rl.<name>.tokens mlme.rl -- remaining tokens this window
# #rl.<name>.refill mlme.rl -- ticks until next refill
#
# Input:
# mlme:input rl.tokens -- int, max tokens (calls) per window
# mlme:input rl.window -- int, refill interval in ticks
# mlme:input rl.bucket -- string, bucket identifier stored in storage
# (used for the refill tick system)
#
# Usage:
# data modify storage mlme:input rl.tokens set value 5
# data modify storage mlme:input rl.window set value 100
# data modify storage mlme:input rl.bucket set value "api_call"
# function mlme:api/ratelimit/init

data modify storage mlme:engine rl_buckets append value {bucket:"",tokens:0,max_tokens:0,window:0,refill_in:0}
data modify storage mlme:engine rl_buckets[-1].bucket set from storage mlme:input rl.bucket
data modify storage mlme:engine rl_buckets[-1].tokens set from storage mlme:input rl.tokens
data modify storage mlme:engine rl_buckets[-1].max_tokens set from storage mlme:input rl.tokens
data modify storage mlme:engine rl_buckets[-1].window set from storage mlme:input rl.window
data modify storage mlme:engine rl_buckets[-1].refill_in set from storage mlme:input rl.window
data remove storage mlme:input rl