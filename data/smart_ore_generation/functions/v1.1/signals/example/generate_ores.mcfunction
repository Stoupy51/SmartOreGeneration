
#> smart_ore_generation:v1.1/signals/example/generate_ores
#
# @example from SimplEnergy datapack
# @author Stoupy51
#
# @english_documentation
# Example of how to use the Smart Ore Generation library
# This example generates 4 patches of Simplunium Ore in the overworld only
# Per region and between world bottom (minecraft default: -64) and y=40
#
# @french_documentation
# Exemple d'utilisation de la librairie Smart Ore Generation
# Cet exemple génère 4 filons de Simplunium Ore dans l'overworld uniquement.
# Par région et entre le point le plus bas du monde (minecraft par défaut : -64) et y=40

# Dimension score, 0 = overworld
scoreboard players set #dimension smart_ore_generation.data -1
execute if predicate simplenergy:in_overworld run scoreboard players set #dimension smart_ore_generation.data 0


# Generate Simplunium Ore (x4) in the overworld only
scoreboard players operation #min_height smart_ore_generation.data = _OVERWORLD_BOTTOM smart_ore_generation.data
scoreboard players set #max_height smart_ore_generation.data 40
execute if score #dimension smart_ore_generation.data matches 0 run function smart_ore_generation:v1.1/signals/example/simplunium_ore
execute if score #dimension smart_ore_generation.data matches 0 run function smart_ore_generation:v1.1/signals/example/simplunium_ore
execute if score #dimension smart_ore_generation.data matches 0 run function smart_ore_generation:v1.1/signals/example/simplunium_ore
execute if score #dimension smart_ore_generation.data matches 0 run function smart_ore_generation:v1.1/signals/example/simplunium_ore

