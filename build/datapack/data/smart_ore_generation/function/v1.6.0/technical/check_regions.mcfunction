
#> smart_ore_generation:v1.6.0/technical/check_regions
#
# @within	smart_ore_generation:v1.6.0/technical/authorized with storage smart_ore_generation:params
#

## Try on these regions: (- = Player, R = Region)
#
#	R	R	R
#	R	-	R
#	R	R	R
#

## Check if regions are loaded
$execute positioned ~-$(region_size) 0 ~-$(region_size) if loaded ~ ~ ~ if predicate smart_ore_generation:v1/is_region_non_generated run function smart_ore_generation:v1.6.0/technical/generate/start
$execute positioned ~0 0 ~-$(region_size) if loaded ~ ~ ~ if predicate smart_ore_generation:v1/is_region_non_generated run function smart_ore_generation:v1.6.0/technical/generate/start
$execute positioned ~$(region_size) 0 ~-$(region_size) if loaded ~ ~ ~ if predicate smart_ore_generation:v1/is_region_non_generated run function smart_ore_generation:v1.6.0/technical/generate/start
$execute positioned ~-$(region_size) 0 ~ if loaded ~ ~ ~ if predicate smart_ore_generation:v1/is_region_non_generated run function smart_ore_generation:v1.6.0/technical/generate/start
$execute positioned ~$(region_size) 0 ~ if loaded ~ ~ ~ if predicate smart_ore_generation:v1/is_region_non_generated run function smart_ore_generation:v1.6.0/technical/generate/start
$execute positioned ~-$(region_size) 0 ~$(region_size) if loaded ~ ~ ~ if predicate smart_ore_generation:v1/is_region_non_generated run function smart_ore_generation:v1.6.0/technical/generate/start
$execute positioned ~ 0 ~$(region_size) if loaded ~ ~ ~ if predicate smart_ore_generation:v1/is_region_non_generated run function smart_ore_generation:v1.6.0/technical/generate/start
$execute positioned ~$(region_size) 0 ~$(region_size) if loaded ~ ~ ~ if predicate smart_ore_generation:v1/is_region_non_generated run function smart_ore_generation:v1.6.0/technical/generate/start

