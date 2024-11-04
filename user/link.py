
# Imports
from python_datapack.constants import *
from python_datapack.utils.print import *
from python_datapack.utils.io import *
from config import *

# Main function is run just before making finalyzing the build process (zip, headers, lang, ...)
def main(config: dict) -> None:
	namespace: str = config["namespace"]
	version: str = config["version"]
	functions: str = f"{config['datapack_functions']}/v{version}"

	# Write additional confirm load things
	write_to_file(f"{functions}/load/confirm_load.mcfunction", f"""
# Objectives initialization
scoreboard objectives add {namespace}.data dummy
scoreboard players set #10 {namespace}.data 10
scoreboard players set #-1 {namespace}.data -1

# Configuration initialization
execute unless score #configured {namespace}.data matches 1 run function {namespace}:v{version}/configuration/setup

# Forceload a region in overworld for a marker
execute in minecraft:overworld run forceload add 0 0
schedule function {namespace}:v{version}/configuration/world_bottom_start 5s
""")
	
	# Write second_5 function
	write_to_file(f"{functions}/second_5.mcfunction", f"""
## Execute on players
execute at @a run function {namespace}:v{version}/technical/player
execute if score #generated {namespace}.data matches 1 run function {namespace}:v{version}/technical/post_generation
scoreboard players set #generated {namespace}.data 0


## Performance profiling
# execute as @e[limit=64] at @s run function {namespace}:v{version}/technical/generate/start
""")
	
	# Copy every file in the manual_merge folder
	MANUAL_MERGE_FOLDER: str = f"{ROOT}/manual_merge"
	for root, _, files in os.walk(MANUAL_MERGE_FOLDER):
		for file in files:
			src = f"{root}/{file}"
			dst = src.replace(MANUAL_MERGE_FOLDER, f"{config['build_datapack']}").replace("VERSION", f"v{version}")
			with super_open(src, "r") as f:
				content = f.read()
				content = content.replace("NAMESPACE", namespace)
				content = content.replace("VERSION", f"v{version}")
				write_to_file(dst, content)
	pass

