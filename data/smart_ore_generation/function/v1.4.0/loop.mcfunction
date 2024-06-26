
## Loop function runs every 2 seconds
execute if score _IS_ENABLED smart_ore_generation.data matches 1 run schedule function smart_ore_generation:v1.4.0/loop 2s replace


## Execute on players
execute at @a run function smart_ore_generation:v1.4.0/technical/player
execute if score #generated smart_ore_generation.data matches 1 run function smart_ore_generation:v1.4.0/technical/post_generation
scoreboard players set #generated smart_ore_generation.data 0


## Performance profiling
#execute as @e[limit=64] at @s run function smart_ore_generation:v1.4.0/technical/generate/start

