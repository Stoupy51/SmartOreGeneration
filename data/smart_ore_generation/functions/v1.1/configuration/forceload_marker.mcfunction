
# Summon Utils Marker
kill @e[tag=smart_ore_generation.utils_marker]
summon marker 0 0 0 {UUID:[I;2013512023,0,0,0],Tags:["smart_ore_generation.utils_marker","global.ignore","global.ignore.pos","global.ignore.kill","smithed.entity","smithed.strict"]}
tell @s 7803c157-0000-0000-0000-000000000000 summoned

# Loop again if not loaded
execute unless loaded 0 0 0 run schedule function smart_ore_generation:v1.1/configuration/forceload_marker 5s

