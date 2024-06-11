
# Launch the function if is the right version
execute if score #smart_ore_generation.major load.status matches 1 if score #smart_ore_generation.minor load.status matches 4 if score #smart_ore_generation.patch load.status matches 0 run function smart_ore_generation:v1.4.0/slots/random_position/launch

