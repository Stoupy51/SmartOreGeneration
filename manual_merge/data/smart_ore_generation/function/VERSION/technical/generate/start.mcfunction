
# Debug level
execute if score _DEBUG_LEVEL NAMESPACE.data matches 1.. run say §6[Smart Ore Generation] §eGenerating new Region!

# Place a barrier block to remember the loaded region
setblock ~ 0 ~ barrier

# Call public function tag
data modify storage NAMESPACE:main initial_pos set from entity @s Pos
execute at @s run function #NAMESPACE:v1/signals/generate_ores

# Indicate that a new region has been generated
scoreboard players set #generated NAMESPACE.data 1

# Debug level
execute if score _DEBUG_LEVEL NAMESPACE.data matches 1.. run say §6[Smart Ore Generation] §eDone generating ores!

