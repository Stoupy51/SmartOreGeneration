
# Debug level
execute if score _DEBUG_LEVEL smart_ore_generation.data matches 1.. run say §6[Smart Ore Generation] §eGenerating new Region!

# Place a barrier block to remember the loaded region
setblock ~ 0 ~ barrier

# Call public function tag
execute at @s run function #smart_ore_generation:v1/signals/generate_ores

# Reset all scoreboard values
scoreboard players reset #max smart_ore_generation.data
scoreboard players reset #r_x smart_ore_generation.data
scoreboard players reset #r_y smart_ore_generation.data
scoreboard players reset #r_z smart_ore_generation.data
scoreboard players reset #new_x smart_ore_generation.data
scoreboard players reset #new_y smart_ore_generation.data
scoreboard players reset #new_z smart_ore_generation.data
scoreboard players reset #random smart_ore_generation.data
scoreboard players reset #min_height smart_ore_generation.data
scoreboard players reset #max_height smart_ore_generation.data
scoreboard players reset #max_attempts smart_ore_generation.data

# Indicate that a new region has been generated
scoreboard players set #generated smart_ore_generation.data 1

# Debug level
execute if score _DEBUG_LEVEL smart_ore_generation.data matches 1.. run say §6[Smart Ore Generation] §eDone generating ores!

