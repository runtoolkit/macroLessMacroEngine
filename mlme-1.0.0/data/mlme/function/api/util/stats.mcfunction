# PUBLIC API -- mlme:api/util/stats
# macroLessMacroEngine v1.0.0
#
# Display runtime stats to @s.
#
# Usage:
# function mlme:api/util/stats

execute store result score #st.q mlme.tick run data get storage mlme:queue commands
execute store result score #st.s mlme.tick run data get storage mlme:schedule jobs
execute store result score #st.e mlme.tick run data get storage mlme:engine events
execute store result score #st.f mlme.tick run data get storage mlme:engine fibers
execute store result score #st.fp mlme.tick run data get storage mlme:engine fiber_pending
execute store result score #st.fq mlme.tick run data get storage mlme:engine fiber_queue
execute store result score #st.st mlme.tick run data get storage mlme:engine state
execute store result score #st.rl mlme.tick run data get storage mlme:engine rl_buckets
execute store result score #st.lk mlme.tick run data get storage mlme:engine locks
execute store result score #st.rp mlme.tick run data get storage mlme:engine repeating

tellraw @s ["",{"text":"[MLME] Runtime stats","color":"aqua"}]
tellraw @s ["",{"text":"  queue.commands:    ","color":"gray"},{"score":{"name":"#st.q","objective":"mlme.tick"}}]
tellraw @s ["",{"text":"  schedule.jobs:     ","color":"gray"},{"score":{"name":"#st.s","objective":"mlme.tick"}}]
tellraw @s ["",{"text":"  events:            ","color":"gray"},{"score":{"name":"#st.e","objective":"mlme.tick"}}]
tellraw @s ["",{"text":"  fibers:            ","color":"gray"},{"score":{"name":"#st.f","objective":"mlme.tick"}}]
tellraw @s ["",{"text":"  fiber_pending:     ","color":"gray"},{"score":{"name":"#st.fp","objective":"mlme.tick"}}]
tellraw @s ["",{"text":"  fiber_queue:       ","color":"gray"},{"score":{"name":"#st.fq","objective":"mlme.tick"}}]
tellraw @s ["",{"text":"  state entries:     ","color":"gray"},{"score":{"name":"#st.st","objective":"mlme.tick"}}]
tellraw @s ["",{"text":"  ratelimit buckets: ","color":"gray"},{"score":{"name":"#st.rl","objective":"mlme.tick"}}]
tellraw @s ["",{"text":"  locks:             ","color":"gray"},{"score":{"name":"#st.lk","objective":"mlme.tick"}}]
tellraw @s ["",{"text":"  repeating tasks:   ","color":"gray"},{"score":{"name":"#st.rp","objective":"mlme.tick"}}]