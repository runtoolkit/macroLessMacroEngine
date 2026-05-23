# Private: not part of MLME public API -- subject to change without notice
# Process pending fiber resumes from mlme:engine fiber_queue (delay-expired entries)

execute unless data storage mlme:engine fiber_queue[0] run return 0

# Pop first item from fiber_queue into temp for execution
data modify storage mlme:temp fiber_item set from storage mlme:engine fiber_queue[0]
data remove storage mlme:engine fiber_queue[0]

# Run the resume_cmd if alive
execute if data storage mlme:temp {fiber_item:{alive:1b}} run function mlme:core/fiber/exec_resume

function mlme:core/fiber/tick
