
#> smart_ore_generation:v1.7.4/tick
#
# @within	smart_ore_generation:v1.7.4/load/tick_verification
#

# Timers
scoreboard players add #second_5 smart_ore_generation.data 1
execute if score #second_5 smart_ore_generation.data matches 90.. run function smart_ore_generation:v1.7.4/second_5

