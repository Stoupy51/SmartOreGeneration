
### Translations
* [English](https://github.com/Stoupy51/SmartOreGeneration/blob/main/README.md)
* [Française](https://github.com/Stoupy51/SmartOreGeneration/blob/main/README.fr.md)


# 📖 Smart Ore Generation
A Minecraft data pack library for handling custom ore generation by using a smart system for ore location.
* This library is an addition to the vanilla ore generation system. It does not replace it.
* It has been designed to be compatible with other ore generation libraries.
* This library only provide a way to generate ores in a smart way, it does not provide custom block functions.
* You can configure the library to generate ores in a specific dimension, or in all dimensions.
* It is working with custom overworld minimum height, a constant score is calculated for overworld only if needed.
* This library supports customs dimensions, but you must add them to the `denied_dimensions` function tag to prevent them from being scanned if you don't want them to be scanned.
* The library will be working even if the world was generated before installing the library because it does not depend on world generation.

This is an embedded library, so you package it inside your datapack as opposed to having a separate download. Requires [LanternLoad](https://github.com/LanternMC/load) to operate.

<br>

# 📚 System explanation
Every 5 seconds, the library run at the location of every player the following steps:
* Run a the function tag `denied_dimensions` to allow you to deny some dimensions from being scanned.
* If the dimension is allowed, 8 regions around players are scanned. (Default region size is 96x96)
* For each region, the library will check if is has already been scanned. If not, it will launch ore generation for this region.
* Then, the function tag `generate_ores` is called at the origin of the region (0, 0, 0).
* You can add your own ore generation function to this tag where you will be generating your ores depending on self-chosen conditions. (like dimensions, biomes, etc...)
* For every patch of ore you generate, you must use the random position function tag `random_position` to get a random position inside the region. This function tag will move the position to a random position and the nearest air block. Doing this way will prevent ores from being generated inside blocks and never be found by players (Adding lag to the server if the ore use an entity). So ores will be easier to find.
* And after every check, the library will save the region as "scanned" to prevent it from being scanned again by adding a `barrier block` at the origin of the region.
* Finally, the function tag `post_generation` is called to allow you to do some post-generation tasks like running a function to all your newly generated ores to add some nbt tags to them or something else.

<br>

# 🔧 Function Tag
## 📥 <ins>Signals</ins>
### `#smart_ore_generation:v1/denied_dimensions`
* This function tag is called when the library want to scan a region. You can add which dimension you want to deny from being scanned by adding a function to this tag.
* To use this signal, you must add a function to the tag list located in `data/smart_ore_generation/tags/function/v1/signals/denied_dimensions.json`.
* Refer to this template for the content of the function [here](https://github.com/Stoupy51/SmartOreGeneration/blob/main/build/datapack/data/smart_ore_generation/function/v1.5.0/signals/denied_dimensions.mcfunction).
```mcfunction
#> smart_ore_generation:v1.5.0/signals/denied_dimensions
#
# @within			#smart_ore_generation:v1/signals/denied_dimensions
# @executed			as & at the player who triggered the event
# @input score		#authorized smart_ore_generation.data equals to 1 or 0 if another datapack has already denied generation
#
## WARNING!
# - You must check the #authorized score matching 1 before executing any commands to prevent reenable generation in a dimension that is disabled by another datapack.
# - Putting the #authorized score to 0 will disable generation in the dimension for every datapack.

## Here is an example to disable generation in a dimension:
execute if score #authorized smart_ore_generation.data matches 1 if predicate simplenergy:in_overworld run scoreboard players set #authorized smart_ore_generation.data 0

## Another example:
execute if score #authorized smart_ore_generation.data matches 1 if dimension minecraft:overworld run scoreboard players set #authorized smart_ore_generation.data 0
```
### `#smart_ore_generation:v1/generate_ores`
* This function tag is called when the library want to generate ores in a region. You can add your own ore generation function to this tag.
* To use this signal, you must add a function to the tag list located in `data/smart_ore_generation/tags/function/v1/signals/generate_ores.json`.
* Refer to this template for the content of the function [here](https://github.com/Stoupy51/SmartOreGeneration/blob/main/build/datapack/data/smart_ore_generation/function/v1.5.0/signals/example/generate_ores.mcfunction)
```mcfunction
#> smart_ore_generation:v1.5.0/signals/generate_ores
#
# @within			#smart_ore_generation:v1/signals/generate_ores
# @executed			as a special marker & at a position you shouldn't care about
#
## WARNING!
# - You must not use /kill @s in this file, or the entire library will stop working.
# - Don't forget to edit #min_height and #max_height scores before trying to generate ores.
#
# @example from SimplEnergy datapack
# This example generates 4 patches of Simplunium Ore in the overworld only
# Per region and between world bottom (minecraft default: -64) and y=40

# Dimension score, 0 = overworld
scoreboard players set #dimension smart_ore_generation.data -1
execute if predicate simplenergy:in_overworld run scoreboard players set #dimension smart_ore_generation.data 0

# Generate Simplunium Ore (x4) in the overworld only
scoreboard players operation #min_height smart_ore_generation.data = _OVERWORLD_BOTTOM smart_ore_generation.data
scoreboard players set #max_height smart_ore_generation.data 40
execute if score #dimension smart_ore_generation.data matches 0 run function smart_ore_generation:v1.5.0/signals/example/simplunium_ore
execute if score #dimension smart_ore_generation.data matches 0 run function smart_ore_generation:v1.5.0/signals/example/simplunium_ore
execute if score #dimension smart_ore_generation.data matches 0 run function smart_ore_generation:v1.5.0/signals/example/simplunium_ore
execute if score #dimension smart_ore_generation.data matches 0 run function smart_ore_generation:v1.5.0/signals/example/simplunium_ore
# See the template in the link for the content of the function smart_ore_generation:v1.5.0/signals/example/simplunium_ore.mcfunction
```
### `#smart_ore_generation:v1/post_generation`
* This function tag is called when the library has finished generating ores in regions. You can add your own post-generation function to this tag.
* To use this signal, you must add a function to the tag list located in `data/smart_ore_generation/tags/function/v1/signals/post_generation.json`.
* Refer to this template for the content of the function [here](https://github.com/Stoupy51/SmartOreGeneration/blob/main/build/datapack/data/smart_ore_generation/function/v1.5.0/signals/example/post_generation.mcfunction)
```mcfunction
#> smart_ore_generation:v1.5.0/signals/post_generation
#
# @within			#smart_ore_generation:v1/signals/post_generation
# @executed			as none at none (default of a /schedule)
#
# This function is executed once after all the ore generation is done.
# For example, if 6 regions are generated, this function will be executed 1 time after all the regions are generated.
# It can be used to do some post-generation tasks, like running a function on all the ores you generated
# instead of running it on each ore individually when you generate it.
# Useful for optimisation.
#
# @example from SimplEnergy datapack
# This example will edit entity nbt for simplunium ore and deepslate simplunium ore
# if they have been generated all along the generation process.
# This is useful for optimisation because you run the "secondary" function only once
# instead of running it on each ore individually when you generate it.

# Place simplunium ore if it has been generated
execute if score #generated_ore simplenergy.data matches 1 as @e[tag=simplenergy.new_simplunium_ore] at @s run function simplenergy:place/simplunium_ore/secondary
execute if score #generated_ore simplenergy.data matches 1 run scoreboard players reset #generated_ore simplenergy.data

# Place deepslate simplunium ore if it has been generated
execute if score #generated_deepslate_ore simplenergy.data matches 1 as @e[tag=simplenergy.new_deepslate_simplunium_ore] at @s run function simplenergy:place/deepslate_simplunium_ore/secondary
execute if score #generated_deepslate_ore simplenergy.data matches 1 run scoreboard players reset #generated_deepslate_ore simplenergy.data
```
## 📤 <ins>Slots</ins>
### `#smart_ore_generation:v1/slots/random_position`
* This function tag should be called when you need a random position in the region.
* To use properly this slot, see the template [here](https://github.com/Stoupy51/SmartOreGeneration/blob/main/build/datapack/data/smart_ore_generation/function/v1.5.0/signals/example/simplunium_ore.mcfunction)
```mcfunction
#> smart_ore_generation:v1.5.0/signals/example/simplunium_ore
#
# @example from SimplEnergy datapack
# Always launch the random position function tag before anything else
# @TIP: The random position is not flat, is has a digit.
# You can use the digit to generate ore on a specific way like below
# It will try to place the ore patch depending on the digit
# so on every line below, somes can fail making it more realistic
# resulting in an ore patch containing between 2 and 6 ores (in this example)

## Try to find a random position adjacent to air in the region to generate the ore
function #smart_ore_generation:v1/slots/random_position

# Placing Simplunium Ore Patch
execute at @s if block ~ ~ ~ #simplenergy:for_simplunium_ore run function simplenergy:calls/smart_ore_generation/simplunium_type
execute at @s positioned ~0.8 ~0.8 ~0.8 if block ~ ~ ~ #simplenergy:for_simplunium_ore run function simplenergy:calls/smart_ore_generation/simplunium_type
execute at @s positioned ~0.0 ~0.8 ~0.8 if block ~ ~ ~ #simplenergy:for_simplunium_ore run function simplenergy:calls/smart_ore_generation/simplunium_type
execute at @s positioned ~0.8 ~0.8 ~0.0 if block ~ ~ ~ #simplenergy:for_simplunium_ore run function simplenergy:calls/smart_ore_generation/simplunium_type
execute at @s positioned ~0.8 ~0.0 ~0.8 if block ~ ~ ~ #simplenergy:for_simplunium_ore run function simplenergy:calls/smart_ore_generation/simplunium_type
execute at @s positioned ~0.0 ~0.8 ~0.0 if block ~ ~ ~ #simplenergy:for_simplunium_ore run function simplenergy:calls/smart_ore_generation/simplunium_type
```

<br>

## How to use
1. Use a datapack merger: [Mitochrondria Online](https://mito.thenuclearnexus.live/)
2. Implement the API as described above.

OR

1. Install [LanternLoad](https://github.com/LanternMC/load) in your data pack
2. Copy the `data/smart_ore_generation` folder into your data pack
3. Merge the contents of `SmartOreGeneration/data/load/tags/function/load.json` and your own `data/load/tags/function/load.json`
4. Implement the API as described above.

