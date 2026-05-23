# Private: not part of MLME public API -- subject to change without notice
data modify storage mlme:queue commands append from storage mlme:batch commands[]
data remove storage mlme:batch commands
function mlme:api/queue/run