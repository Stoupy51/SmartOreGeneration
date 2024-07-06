
# Check for an unvisited zone if dimension is authorized
scoreboard players set #authorized NAMESPACE.data 1
function #NAMESPACE:v1/signals/denied_dimensions
execute if score #authorized NAMESPACE.data matches 1 summon marker run function NAMESPACE:VERSION/technical/authorized

