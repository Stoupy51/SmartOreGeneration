
#> smart_ore_generation:v1.5.0/technical/post_generation
#
# @within	smart_ore_generation:v1.5.0/second_5
#

# Debug message
execute if score _DEBUG_LEVEL smart_ore_generation.data matches 1.. run say §6[Smart Ore Generation] §ePost generation

# Launch signals for others datapacks to use
function #smart_ore_generation:v1/signals/post_generation

# Reset scoreboard players
scoreboard players reset #generated smart_ore_generation.data

