
# pyright: reportUnknownVariableType=false
# Imports
from beet import ProjectConfig
from stewbeet import JsonDict
from stewbeet.continuous_delivery import load_credentials, upload_to_github, upload_to_modrinth, upload_to_pmc, upload_to_smithed
from stewbeet.utils import get_project_config
from stouputils.io import read_file

# Get credentials and try to find the beet configuration
credentials: dict[str, str] = load_credentials("~/stewbeet/credentials.yml")
cfg: ProjectConfig = get_project_config()


## Uploads
# Upload to GitHub
github_config: JsonDict = {
    "project_name": cfg.name,
    "version": cfg.version,
    "build_folder": cfg.output,
    "endswith": [".zip", ".jar"]
}
changelog: str = upload_to_github(credentials, github_config)

# Upload to Modrinth
modrinth_config: JsonDict = {
	"slug": cfg.id,
	"project_name": cfg.name,
	"version": cfg.version,
	"authors": cfg.author,
	"summary": "A Minecraft data pack library for handling custom ore generation by using a smart system for ore location.",
	"description_markdown": read_file(f"{cfg.directory}/README.md"),
	"version_type": "release",
	"build_folder": cfg.output,
}
upload_to_modrinth(credentials, modrinth_config, changelog)

# Upload to Smithed
smithed_config: JsonDict = {
	"project_id": cfg.id,
	"project_name": cfg.name,
	"version": cfg.version,
}
upload_to_smithed(credentials, smithed_config, changelog)

# Upload to PlanetMinecraft
pmc_config: JsonDict = {
	"project_url": "https://www.planetminecraft.com/account/manage/data-packs/6471186/",
	"version": cfg.version,
}
upload_to_pmc(pmc_config, changelog)

