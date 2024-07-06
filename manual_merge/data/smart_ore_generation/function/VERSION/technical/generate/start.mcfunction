
# Debug level
execute if score _DEBUG_LEVEL NAMESPACE.data matches 1.. run say §6[Smart Ore Generation] §eGenerating new Region!

# Place a barrier block to remember the loaded region
setblock ~ 0 ~ barrier

# Call public function tag
data modify storage NAMESPACE:main initial_pos set from entity @s Pos
execute at @s run function #NAMESPACE:v1/signals/generate_ores

# Reset all scoreboard values
scoreboard players reset #max NAMESPACE.data
scoreboard players reset #r_x NAMESPACE.data
scoreboard players reset #r_y NAMESPACE.data
scoreboard players reset #r_z NAMESPACE.data
scoreboard players reset #new_x NAMESPACE.data
scoreboard players reset #new_y NAMESPACE.data
scoreboard players reset #new_z NAMESPACE.data
scoreboard players reset #random NAMESPACE.data
scoreboard players reset #min_height NAMESPACE.data
scoreboard players reset #max_height NAMESPACE.data
scoreboard players reset #max_attempts NAMESPACE.data

# Indicate that a new region has been generated
scoreboard players set #generated NAMESPACE.data 1

# Debug level
execute if score _DEBUG_LEVEL NAMESPACE.data matches 1.. run say §6[Smart Ore Generation] §eDone generating ores!

