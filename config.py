
# Imports
import os
ROOT: str = os.path.dirname(os.path.realpath(__file__)).replace("\\", "/")
IGNORE_UNSET: bool = True							# If True, the program will ignore unset optionnal values in the configuration dictionnary


# Folders
BUILD_FOLDER: str = f"{ROOT}/build"					# Folder where the final datapack and resource pack are built
BUILD_COPY_DESTINATIONS: tuple[list, list] = (["E:/my_folders/advanced_desktop/Python Datapack/src/python_datapack/dependencies/datapack/Smart Ore Generation.zip"], [])	# Can be empty lists if you don't want to copy the generated files

# Datapack related constants
AUTHOR: str = "Stoupy51"					# Author(s) name(s) displayed in pack.mcmeta, also used to add convention.debug tag to the players of the same name(s) <-- showing additionnal displays like datapack loading
PROJECT_NAME: str = "Smart Ore Generation"	# Name of the datapack, used for messages and items lore
VERSION: str = "1.6.0"						# Datapack version in the following mandatory format: major.minor.patch, ex: 1.0.0 or 1.21.615
NAMESPACE: str = "smart_ore_generation"		# Should be the same you use in the merge folder. Used to namespace functions, tags, etc.
DESCRIPTION = f"{PROJECT_NAME} [{VERSION}] by {AUTHOR}"	# Pack description displayed in pack.mcmeta


# Configuration dictionnary
configuration = {
	"ignore_unset": IGNORE_UNSET,

	"build_folder": BUILD_FOLDER,
	"build_copy_destinations": BUILD_COPY_DESTINATIONS,
	"author": AUTHOR,
	"project_name": PROJECT_NAME,
	"version": VERSION,
	"namespace": NAMESPACE,
	"description": DESCRIPTION,
}

