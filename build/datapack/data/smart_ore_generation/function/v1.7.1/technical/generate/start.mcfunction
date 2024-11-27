
#> smart_ore_generation:v1.7.1/technical/generate/start
#
# @within	smart_ore_generation:v1.7.1/second_5
#			smart_ore_generation:v1.7.1/technical/check_regions
#

# Debug level
execute if score _DEBUG_LEVEL smart_ore_generation.data matches 1.. run say §6[Smart Ore Generation] §eGenerating new Region!

# Place a barrier block to remember the loaded region
setblock ~ 0 ~ barrier

# Call public function tag
data modify storage smart_ore_generation:main initial_pos set from entity @s Pos
execute at @s run function #smart_ore_generation:v1/signals/generate_ores

# Indicate that a new region has been generated
scoreboard players set #generated smart_ore_generation.data 1

# Debug level
execute if score _DEBUG_LEVEL smart_ore_generation.data matches 1.. run say §6[Smart Ore Generation] §eDone generating ores!

