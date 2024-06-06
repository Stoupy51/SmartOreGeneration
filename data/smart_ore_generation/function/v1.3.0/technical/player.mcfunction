
# Check for an unvisited zone if dimension is authorized
scoreboard players set #authorized smart_ore_generation.data 1
function #smart_ore_generation:v1/signals/denied_dimensions
execute if score #authorized smart_ore_generation.data matches 1 summon marker run function smart_ore_generation:v1.3.0/technical/authorized

