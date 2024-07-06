
# Imports
import os
ROOT: str = os.path.dirname(os.path.realpath(__file__)).replace("\\", "/")
IGNORE_UNSET: bool = True							# If True, the program will ignore unset optionnal values in the configuration dictionnary


# Folders
BUILD_FOLDER: str = f"{ROOT}/build"					# Folder where the final datapack and resource pack are built
BUILD_COPY_DESTINATIONS: tuple[list, list] = (["E:/my_folders/advanced_desktop/Python Datapack/src/python_datapack/dependencies/datapack/Smart Ore Generation.zip"], [])	# Can be empty lists if you don't want to copy the generated files

# Datapack related constants
AUTHOR: str = "Stoupy51"					# Author(s) name(s) displayed in pack.mcmeta, also used to add convention.debug tag to the players of the same name(s) <-- showing additionnal displays like datapack loading
DATAPACK_NAME: str = "Smart Ore Generation"	# Name of the datapack, used for messages and items lore
MINECRAFT_VERSION: str = "1.21"				# Text used when loading the datapack to warn the user when the data version is not right
VERSION: str = "1.5.0"						# Datapack version in the following mandatory format: major.minor.patch, ex: 1.0.0 or 1.21.615
NAMESPACE: str = "smart_ore_generation"		# Should be the same you use in the merge folder. Used to namespace functions, tags, etc.
DATAPACK_FORMAT: int = 48					# Pack format version, see https://minecraft.wiki/w/Pack_format#List_of_data_pack_formats
DESCRIPTION = f"{DATAPACK_NAME} [{VERSION}] by {AUTHOR}"	# Pack description displayed in pack.mcmeta


# Configuration dictionnary
configuration = {
	"ignore_unset": IGNORE_UNSET,

	"build_folder": BUILD_FOLDER,
	"build_copy_destinations": BUILD_COPY_DESTINATIONS,
	"author": AUTHOR,
	"datapack_name": DATAPACK_NAME,
	"minecraft_version": MINECRAFT_VERSION,
	"version": VERSION,
	"namespace": NAMESPACE,
	"datapack_format": DATAPACK_FORMAT,
	"description": DESCRIPTION,
}

