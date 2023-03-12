
## Try on these regions: (- = Player, R = Region)
#
#	R	R	R
#	R	-	R
#	R	R	R
#

## Check if regions are loaded
execute positioned ~-96 0 ~-96 if predicate smart_ore_generation:v1/is_region_non_generated run function smart_ore_generation:v1.1/technical/generate/start
execute positioned ~0 0 ~-96 if predicate smart_ore_generation:v1/is_region_non_generated run function smart_ore_generation:v1.1/technical/generate/start
execute positioned ~96 0 ~-96 if predicate smart_ore_generation:v1/is_region_non_generated run function smart_ore_generation:v1.1/technical/generate/start
execute positioned ~-96 0 ~ if predicate smart_ore_generation:v1/is_region_non_generated run function smart_ore_generation:v1.1/technical/generate/start
execute positioned ~96 0 ~ if predicate smart_ore_generation:v1/is_region_non_generated run function smart_ore_generation:v1.1/technical/generate/start
execute positioned ~-96 0 ~96 if predicate smart_ore_generation:v1/is_region_non_generated run function smart_ore_generation:v1.1/technical/generate/start
execute positioned ~ 0 ~96 if predicate smart_ore_generation:v1/is_region_non_generated run function smart_ore_generation:v1.1/technical/generate/start
execute positioned ~96 0 ~96 if predicate smart_ore_generation:v1/is_region_non_generated run function smart_ore_generation:v1.1/technical/generate/start

