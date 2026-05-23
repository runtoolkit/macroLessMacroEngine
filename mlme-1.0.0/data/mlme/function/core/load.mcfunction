# MLME internal load -- do not call directly
# Private: mlme:core/* functions are not part of the public API

forceload add 0 0

scoreboard objectives add mlme.queue dummy
scoreboard objectives add mlme.tick dummy
scoreboard objectives add mlme.compat dummy
scoreboard objectives add mlme.cd dummy
scoreboard objectives add mlme.flag dummy
scoreboard objectives add mlme.perm dummy
scoreboard objectives add mlme.ctr dummy
scoreboard objectives add mlme.lock dummy
scoreboard objectives add mlme.deaths minecraft.custom:minecraft.deaths
scoreboard objectives add mlme.deaths_prev dummy
scoreboard objectives add mlme.levels minecraft.custom:minecraft.play_one_minute
scoreboard objectives add mlme.levels_prev dummy

scoreboard players set #tick mlme.tick 0
scoreboard players set #queue.active mlme.compat 0
scoreboard players set #sched.exists mlme.compat 0
scoreboard players set #gcd.global mlme.cd 0
scoreboard players set #ev.idx mlme.tick 0
scoreboard players set #fb.size mlme.tick 0
scoreboard players set #fb.idx mlme.tick 0

# Initialize fiber engine storage
execute unless data storage mlme:engine {fiber_seq:0} run data modify storage mlme:engine fiber_seq set value 0
execute unless data storage mlme:engine {fibers:[]} run data modify storage mlme:engine fibers set value []
execute unless data storage mlme:engine {fiber_pending:[]} run data modify storage mlme:engine fiber_pending set value []
execute unless data storage mlme:engine {fiber_queue:[]} run data modify storage mlme:engine fiber_queue set value []
execute unless data storage mlme:engine {events:[]} run data modify storage mlme:engine events set value []
execute unless data storage mlme:engine {state:[]} run data modify storage mlme:engine state set value []
execute unless data storage mlme:engine {rl_buckets:[]} run data modify storage mlme:engine rl_buckets set value []
execute unless data storage mlme:engine {locks:[]} run data modify storage mlme:engine locks set value []
execute unless data storage mlme:engine {repeating:[]} run data modify storage mlme:engine repeating set value []

# Initialize debug flag (default: off)
execute unless data storage mlme:config {debug:1b} run data modify storage mlme:config debug set value 0b

# LanternLoad: advertise MLME version
# v1.0.0 -> 1000000
scoreboard players set mlme load.status 1000000

tellraw @a ["",{"text":"[MLME] ","color":"aqua"},{"text":"macroLessMacroEngine v1.0.0 loaded!","color":"white"}]