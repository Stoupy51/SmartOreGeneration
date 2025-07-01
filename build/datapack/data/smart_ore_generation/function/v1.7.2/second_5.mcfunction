
#> smart_ore_generation:v1.7.2/second_5
#
# @within	smart_ore_generation:v1.7.2/tick
#

# Reset timer
scoreboard players set #second_5 smart_ore_generation.data -10

## Execute on players
execute at @a run function smart_ore_generation:v1.7.2/technical/player
execute if score #generated smart_ore_generation.data matches 1 run function smart_ore_generation:v1.7.2/technical/post_generation
scoreboard players set #generated smart_ore_generation.data 0

## Performance profiling
# execute as @e[limit=64] at @s run function smart_ore_generation:v1.7.2/technical/generate/start

