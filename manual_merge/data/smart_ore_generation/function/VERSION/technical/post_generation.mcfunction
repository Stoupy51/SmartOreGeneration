
# Debug message
execute if score _DEBUG_LEVEL NAMESPACE.data matches 1.. run say §6[Smart Ore Generation] §ePost generation

# Launch signals for others datapacks to use
function #NAMESPACE:v1/signals/post_generation

# Reset scoreboard players
scoreboard players reset #generated NAMESPACE.data

