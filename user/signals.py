
# ruff: noqa: E501
# Imports
from stewbeet import Context, write_versioned_function


# Main function is run just before making finalyzing the build process (zip, headers, lang, ...)
def beet_default(ctx: Context) -> None:
	ns: str = ctx.project_id
	version: str = ctx.project_version

	## Signals
	write_versioned_function("signals/denied_dimensions", f"""
#> denied_dimensions
#
# @executed			as & at the player who triggered the event
# @input score		#authorized {ns}.data equals to 1 or 0 if another datapack has already denied generation
#
# @english_WARNING
# - You must check the #authorized score matching 1 before executing any commands to prevent reenable generation in a dimension that is disabled by another datapack.
# - Putting the #authorized score to 0 will disable generation in the dimension for every datapack.
#
# @french_WARNING
# - Vous devez vérifier que le score #authorized vaut 1 avant d'exécuter des commandes pour éviter de réactiver la génération dans une dimension qui est désactivée par un autre datapack.
# - Mettre le score #authorized à 0 désactivera la génération dans la dimension pour tous les datapacks.

## Here is an example to disable generation in a dimension:
# execute if score #authorized {ns}.data matches 1 if predicate simplenergy:in_overworld run scoreboard players set #authorized {ns}.data 0

## Another example:
# execute if score #authorized {ns}.data matches 1 if dimension minecraft:overworld run scoreboard players set #authorized {ns}.data 0
""", tags=[f"{ns}:v1/signals/denied_dimensions"])
	write_versioned_function("signals/generate_ores", f"""
#> generate_ores
#
# @executed			as a special marker & at a position you shouldn't care about
#
## WARNING!
# - You must not use /kill @s in this file, or the entire library will stop working.
# - Don't forget to edit #min_height and #max_height scores before trying to generate ores.

## Example of a function to generate ores in {ns}:v1/signals/example/generate_ores
# You can use this function as a template to create your own functions.
""", tags=[f"{ns}:v1/signals/generate_ores"])
	write_versioned_function("signals/post_generation", f"""
#> {ns}:v{version}/signals/post_generation
#
# @executed			as none at none (default of a /schedule)
#
# This function is executed once after all the ore generation is done.
# For example, if 6 regions are generated, this function will be executed 1 time after all the regions are generated.
# It can be used to do some post-generation tasks, like running a function on all the ores you generated
# instead of running it on each ore individually when you generate it.
""", tags=[f"{ns}:v1/signals/post_generation"])

	# Examples
	write_versioned_function("signals/example/generate_ores", f"""
#> generate_ores
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
scoreboard players set #dimension {ns}.data -1
execute if dimension minecraft:overworld run scoreboard players set #dimension {ns}.data 0


# Generate Simplunium Ore (x4) in the overworld only
scoreboard players operation #min_height {ns}.data = _OVERWORLD_BOTTOM {ns}.data
scoreboard players set #max_height {ns}.data 40
execute if score #dimension {ns}.data matches 0 run function {ns}:v{version}/signals/example/simplunium_ore
execute if score #dimension {ns}.data matches 0 run function {ns}:v{version}/signals/example/simplunium_ore
execute if score #dimension {ns}.data matches 0 run function {ns}:v{version}/signals/example/simplunium_ore
execute if score #dimension {ns}.data matches 0 run function {ns}:v{version}/signals/example/simplunium_ore
""")
	write_versioned_function("signals/example/simplunium_ore", f"""
#> simplunium_ore
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
function #{ns}:v1/slots/random_position

# Placing Simplunium Ore Patch
# execute at @s if block ~ ~ ~ #simplenergy:for_simplunium_ore run function simplenergy:calls/{ns}/simplunium_type
# execute at @s positioned ~0.8 ~0.8 ~0.8 if block ~ ~ ~ #simplenergy:for_simplunium_ore run function simplenergy:calls/{ns}/simplunium_type
# execute at @s positioned ~0.0 ~0.8 ~0.8 if block ~ ~ ~ #simplenergy:for_simplunium_ore run function simplenergy:calls/{ns}/simplunium_type
# execute at @s positioned ~0.8 ~0.8 ~0.0 if block ~ ~ ~ #simplenergy:for_simplunium_ore run function simplenergy:calls/{ns}/simplunium_type
# execute at @s positioned ~0.8 ~0.0 ~0.8 if block ~ ~ ~ #simplenergy:for_simplunium_ore run function simplenergy:calls/{ns}/simplunium_type
# execute at @s positioned ~0.0 ~0.8 ~0.0 if block ~ ~ ~ #simplenergy:for_simplunium_ore run function simplenergy:calls/{ns}/simplunium_type
""")

