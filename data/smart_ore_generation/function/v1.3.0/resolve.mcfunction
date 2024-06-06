
execute if score #smart_ore_generation.major load.status matches 1 if score #smart_ore_generation.minor load.status matches 3 if score #smart_ore_generation.patch load.status matches 0 run schedule function smart_ore_generation:v1.3.0/load 1t

