### Translations
* [English](https://github.com/Stoupy51/SmartOreGeneration/blob/main/README.md)
* [Française](https://github.com/Stoupy51/SmartOreGeneration/blob/main/README.fr.md)


# 📖 Smart Ore Generation
Librairie Minecraft sous forme de data pack pour gérer la durabilité custom sur tous les items abîmables (vanilla, custom, and moddé).
* Cette durabilité custom est crée en simulant une sorte d'enchantement unbreaking sur l'item.
* Par exemple, si vous avez un item avec une durabilité de 100, et que vous appliquez un multiplicateur de 2.0, l'item aura 50% de chance de vraiment perdre de la durabilité. Vous allez donc utiliser cet item 2x plus comme s'il avait 200 de durabilité.
* Cette librairie vous fournit un multiplicateur totalement configurable pour chaque item spécifique en fonction de son id et de son tag nbt.
* Ce système est entièrement compatible avec les enchantements unbreaking et mending.

Il s'agit d'une librairie intégrée que vous intégrez dans votre Datapack au lieu d'avoir à le télécharger séparément. Nécessite [LanternLoad](https://github.com/LanternMC/load) pour fonctionner.


## Différences entre cette librairie et Smithed Custom Durability
* Cette librairie ne remplace pas Smithed Custom Durability, elle peut être utilisée simultanément.
* Vous pouvez directement réparer les items dans une enclume.
* Vous n'avez pas besoin d'ajouter des nbt spécifiques à vos items.
* Vous pouvez utiliser cette librairie avec tous les items qui perdent de la durabilité, y compris les items provenant de mods.
* Nous n'utilisons pas de lore custom pour montrer la durabilité personnalisée.
* Si votre item perd plusieurs durabilités en même temps, la valeur qu'il perd est divisée par le multiplicateur.



## Function Tag
Le Function tag est un signal appelé par la librairie pour vous informer qu'un événement s'est produit, et vous permet d'apporter des modifications à cet événement.
* Pour utiliser ce signal, vous devez ajouter une fonction à la liste des tags située dans `data/smart_ore_generation/tags/functions/v1/durability_changed.json`.
* Référez-vous à ce model pour le contenu de la fonction [ici](https://github.com/Stoupy51/SmartOreGeneration/blob/main/data/smart_ore_generation/functions/v1.0/signal_received_template_fr.mcfunction)
```mcfunction
##Doit être appelée par le function tag #smart_ore_generation:v1/durability_changed
##Définissez le multiplicateur de durabilité comparé à celle vanilla
##N'oubliez pas que votre multiplicateur doit être >= 1000, sinon cela n'a aucun effet.
##Ex. si vous voulez multiplier la durabilité par un facteur x4.5
##Vous allez mettre le score #multiplier à 4500 (4500 divisé by 1000 = 4.5)

#Exemple pris du data pack SimplEnergy
#Durabilité Custom pour les équipments en Simplunium (x7 pour l'armure en cuir & x1.2 pour les outils en diamant)
#La durabilité dans la seconde main est inutile ici car aucun outil en diamant ne peut y être utilisé.
	scoreboard players set #multiplier smart_ore_generation.data 7000
	execute if score #head_valid smart_ore_generation.data matches 1 if data storage smart_ore_generation:main head{tag:{simplenergy:{simplunium:1b}}} run function #smart_ore_generation:event/head
	execute if score #chest_valid smart_ore_generation.data matches 1 if data storage smart_ore_generation:main chest{tag:{simplenergy:{simplunium:1b}}} run function #smart_ore_generation:event/chest
	execute if score #legs_valid smart_ore_generation.data matches 1 if data storage smart_ore_generation:main legs{tag:{simplenergy:{simplunium:1b}}} run function #smart_ore_generation:event/legs
	execute if score #feet_valid smart_ore_generation.data matches 1 if data storage smart_ore_generation:main feet{tag:{simplenergy:{simplunium:1b}}} run function #smart_ore_generation:event/feet
	scoreboard players set #multiplier smart_ore_generation.data 1200
	execute if score #mainhand_valid smart_ore_generation.data matches 1 if data storage smart_ore_generation:main mainhand{tag:{simplenergy:{simplunium:1b}}} run function #smart_ore_generation:event/mainhand
	#execute if score #offhand_valid smart_ore_generation.data matches 1 if data storage smart_ore_generation:main offhand{tag:{simplenergy:{simplunium:1b}}} run function #smart_ore_generation:event/offhand

#Exemple qui multiple la durabilité de toutes les elytra sur le serveur par 2
	scoreboard players set #multiplier smart_ore_generation.data 2000
	execute if score #chest_valid smart_ore_generation.data matches 1 if data storage smart_ore_generation:main chest{id:"minecraft:elytra"} run function #smart_ore_generation:event/chest
	##Si un multiplicateur est appliqué sur un slot, vous ne pouvez pas l'exécuter à nouveau sur le même slot, donc cette commande ne sera jamais exécutée.
	execute if score #chest_valid smart_ore_generation.data matches 1 if data storage smart_ore_generation:main chest{id:"minecraft:elytra",tag:{custom_elytra:1b}} run function #smart_ore_generation:event/chest

#Exemple avec des cannes à pêche et des boucliers (x3.14) et différentes syntaxes
	scoreboard players set #multiplier smart_ore_generation.data 3140
	execute if score #mainhand_valid smart_ore_generation.data matches 1 if data storage smart_ore_generation:main mainhand{tag:{ctc:{id:"diamond_fishing_rod",from:"a_certain_pack"}}} run function #smart_ore_generation:event/mainhand
	execute if score #offhand_valid smart_ore_generation.data matches 1 if data storage smart_ore_generation:main offhand.tag.ctc{id:"diamond_fishing_rod",from:"a_certain_pack"} run function #smart_ore_generation:event/offhand
	execute if score #mainhand_valid smart_ore_generation.data matches 1 if data storage smart_ore_generation:main mainhand.tag.some_private_nbt.diamond_shield run function #smart_ore_generation:event/mainhand
	execute if score #offhand_valid smart_ore_generation.data matches 1 if data storage smart_ore_generation:main offhand.tag.some_private_nbt{diamond_shield:1b} run function #smart_ore_generation:event/offhand

#Exemple pour tous les items ayant le lore "Almost Unbreakable" avec différentes syntaxes
	scoreboard players set #multiplier smart_ore_generation.data 2147483647
	execute if score #head_valid smart_ore_generation.data matches 1 if data storage smart_ore_generation:main head.tag.display{Lore:['[{"text":"Almost Unbreakable","italic":false,"color":"red"}]']} run function #smart_ore_generation:event/head
	execute if score #chest_valid smart_ore_generation.data matches 1 if data storage smart_ore_generation:main chest.tag{display:{Lore:['[{"text":"Almost Unbreakable","italic":false,"color":"red"}]']}} run function #smart_ore_generation:event/chest
	execute if score #legs_valid smart_ore_generation.data matches 1 if data storage smart_ore_generation:main legs{tag:{display:{Lore:['[{"text":"Almost Unbreakable","italic":false,"color":"red"}]']}}} run function #smart_ore_generation:event/legs
	execute if score #feet_valid smart_ore_generation.data matches 1 if data storage smart_ore_generation:main feet{tag:{display:{Lore:['[{"text":"Almost Unbreakable","italic":false,"color":"red"}]']}}} run function #smart_ore_generation:event/feet
	execute if score #mainhand_valid smart_ore_generation.data matches 1 if data storage smart_ore_generation:main mainhand{tag:{display:{Lore:['[{"text":"Almost Unbreakable","italic":false,"color":"red"}]']}}} run function #smart_ore_generation:event/mainhand
	execute if score #offhand_valid smart_ore_generation.data matches 1 if data storage smart_ore_generation:main offhand{tag:{display:{Lore:['[{"text":"Almost Unbreakable","italic":false,"color":"red"}]']}}} run function #smart_ore_generation:event/offhand
```



## Comment l'utiliser ?
1. Utilisez un datapack merger : [Mitochrondria Online](https://mito.thenuclearnexus.live/)
2. Implémentez l'API comme décrit ci-dessus.
OU
1. Installez [LanternLoad](https://github.com/LanternMC/load) dans votre data pack
2. Copiez le dossier `data/smart_ore_generation` dans votre data pack
3. Fusionnez le contenu de `SmartOreGeneration/data/load/tags/functions/load.json` et votre `data/load/tags/functions/load.json`
4. Implémentez l'API comme décrit ci-dessus.

