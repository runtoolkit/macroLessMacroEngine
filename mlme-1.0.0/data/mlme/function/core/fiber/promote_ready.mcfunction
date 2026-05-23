# Private: not part of MLME public API -- subject to change without notice
# Move temp fp entry to fiber_queue (delay expired)
data modify storage mlme:engine fiber_queue append from storage mlme:temp fp
data remove storage mlme:engine fiber_pending[0]
data remove storage mlme:temp fp
