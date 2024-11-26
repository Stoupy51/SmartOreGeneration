
# Imports
from python_datapack.constants import *
from python_datapack.utils.print import *
from python_datapack.utils.io import *
from config import *

# Main function is run just before making finalyzing the build process (zip, headers, lang, ...)
def main(config: dict) -> None:
	namespace: str = config["namespace"]
	version: str = config["version"]
	major, minor, patch = version.split(".")

	# Write additional confirm load things
	write_to_load_file(config, f"""
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
	write_to_versioned_file(config, "second_5", f"""
## Execute on players
execute at @a run function {namespace}:v{version}/technical/player
execute if score #generated {namespace}.data matches 1 run function {namespace}:v{version}/technical/post_generation
scoreboard players set #generated {namespace}.data 0


## Performance profiling
# execute as @e[limit=64] at @s run function {namespace}:v{version}/technical/generate/start
""")
	
	# Random position slot
	write_to_versioned_file(config, "slots/random_position", f"""
# Launch the function if is the right version
execute if score #{namespace}.major load.status matches {major} if score #{namespace}.minor load.status matches {minor} if score #{namespace}.patch load.status matches {patch} run function {namespace}:v{version}/slots/random_position/launch
""")
	
	# Copy every file in the manual_merge folder
	MANUAL_MERGE_FOLDER: str = f"{ROOT}/manual_merge"
	for root, _, files in os.walk(MANUAL_MERGE_FOLDER):
		for file in files:
			src: str = f"{root}/{file}"
			dst: str = src.replace(MANUAL_MERGE_FOLDER, f"{config['build_datapack']}").replace("VERSION", f"v{version}")
			with super_open(src, "r") as f:
				content: str = f.read()
				content = content.replace("NAMESPACE", namespace)
				content = content.replace("VERSION", f"v{version}")
				write_to_file(dst, content)
	pass

