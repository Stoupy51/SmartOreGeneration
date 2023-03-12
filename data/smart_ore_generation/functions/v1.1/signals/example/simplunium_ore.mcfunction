
#> smart_ore_generation:v1.1/signals/example/simplunium_ore
#
# @example from SimplEnergy datapack
# @author Stoupy51
#
# @english_documentation
# Example of how to find a random position in a region to generate ore
# Always launch the random position function tag before anything else
# @TIP: The random position is not flat, is has a digit.
# You can use the digit to generate ore on a specific way like below
# It will try to place the ore patch depending on the digit
# so on every line below, somes can fail making it more realistic
# resulting in an ore patch containing between 2 and 6 ores (in this example)
#
# @french_documentation
# Exemple de comment trouver une position aléatoire dans une région pour générer un minerai
# Toujours lancer le function tag de position aléatoire avant tout
# @TIP: La position aléatoire n'est pas plate, elle a un chiffre après la virgule.
# Vous pouvez utiliser ce chiffre pour générer le minerai d'une certaine manière comme ci-dessous
# Il va essayer de placer le filon de minerai en fonction du chiffre
# donc sur chaque ligne ci-dessous, certaines peuvent échouer rendant cela plus réaliste
# résultant en un filon de minerai contenant entre 2 et 6 minerais (dans cet exemple)

## Try to find a random position adjacent to air in the region to generate the ore
function #smart_ore_generation:v1/slots/random_position

# Placing Simplunium Ore Patch
execute at @s if block ~ ~ ~ #simplenergy:for_simplunium_ore run function simplenergy:calls/smart_ore_generation/simplunium_type
execute at @s positioned ~0.8 ~0.8 ~0.8 if block ~ ~ ~ #simplenergy:for_simplunium_ore run function simplenergy:calls/smart_ore_generation/simplunium_type
execute at @s positioned ~0.0 ~0.8 ~0.8 if block ~ ~ ~ #simplenergy:for_simplunium_ore run function simplenergy:calls/smart_ore_generation/simplunium_type
execute at @s positioned ~0.8 ~0.8 ~0.0 if block ~ ~ ~ #simplenergy:for_simplunium_ore run function simplenergy:calls/smart_ore_generation/simplunium_type
execute at @s positioned ~0.8 ~0.0 ~0.8 if block ~ ~ ~ #simplenergy:for_simplunium_ore run function simplenergy:calls/smart_ore_generation/simplunium_type
execute at @s positioned ~0.0 ~0.8 ~0.0 if block ~ ~ ~ #simplenergy:for_simplunium_ore run function simplenergy:calls/smart_ore_generation/simplunium_type

