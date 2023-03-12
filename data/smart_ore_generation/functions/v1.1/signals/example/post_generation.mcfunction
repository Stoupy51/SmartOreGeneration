
#> smart_ore_generation:v1.1/signals/example/post_generation
#
# @example from SimplEnergy datapack
# @author Stoupy51
#
# @english_documentation
# Example of post generation function
# This example will edit entity nbt for simplunium ore and deepslate simplunium ore
# if they have been generated all along the generation process.
# This is useful for optimisation because you run the "secondary" function only once
# instead of running it on each ore individually when you generate it.
#
# @french_documentation
# Exemple de fonction post génération
# Cet exemple va éditer les nbt des entités pour les simplunium ore et deepslate simplunium ore
# si ils ont été générés tout au long du processus de génération.
# Ceci est utile pour l'optimisation car vous n'exécutez la fonction "secondary" qu'une seule fois
# au lieu de l'exécuter sur chaque minerai individuellement lorsque vous le générez.

# Place simplunium ore if it has been generated
execute if score #generated_ore simplenergy.data matches 1 as @e[tag=simplenergy.new_simplunium_ore] at @s run function simplenergy:place/simplunium_ore/secondary
execute if score #generated_ore simplenergy.data matches 1 run scoreboard players reset #generated_ore simplenergy.data

# Place deepslate simplunium ore if it has been generated
execute if score #generated_deepslate_ore simplenergy.data matches 1 as @e[tag=simplenergy.new_deepslate_simplunium_ore] at @s run function simplenergy:place/deepslate_simplunium_ore/secondary
execute if score #generated_deepslate_ore simplenergy.data matches 1 run scoreboard players reset #generated_deepslate_ore simplenergy.data

