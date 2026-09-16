
#> smart_ore_generation:v1.7.4/unload
#
# @within	#smart_ore_generation:unload
#

# Remove scoreboard objectives
scoreboard objectives remove load.status
scoreboard objectives remove smart_ore_generation.data

# Clear storages
data remove storage smart_ore_generation:main Pos
data remove storage smart_ore_generation:main initial_pos

