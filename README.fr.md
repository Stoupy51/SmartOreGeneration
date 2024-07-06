
### Translations
* [English](https://github.com/Stoupy51/SmartOreGeneration/blob/main/README.md)
* [Française](https://github.com/Stoupy51/SmartOreGeneration/blob/main/README.fr.md)


# 📖 Smart Ore Generation
Librairie Minecraft sous forme de data pack pour gérer la génération de minerais custom en utilisant un système intelligent pour la position des minerais.
* Cette librairie est un complément au système de génération de minerai vanilla. Elle ne le remplace pas.
* Elle a été conçue pour être compatible avec d'autres librairies de génération de minerai.
* Cette librairie ne fournit qu'un moyen de générer des minerais de manière intelligente, elle ne fournit pas de fonctions de pour l'implémentation de custom blocks.
* Vous pouvez configurer la librairie pour générer des minerais dans une dimension spécifique, ou dans toutes les dimensions.
* Elle fonctionne avec une hauteur minimale personnalisée de l'overworld, un score constant est calculé pour l'overworld uniquement si besoin.
* Cette librairie supporte les dimensions customs, mais vous devez les ajouter au function tag `denied_dimensions` pour les empêcher d'être scannées si vous ne voulez pas qu'elles le soient.
* La librairie fonctionnera même si le monde a été généré avant l'installation de celle-ci car elle ne dépend pas de la génération du monde.

Il s'agit d'une librairie intégrée que vous intégrez dans votre Datapack au lieu d'avoir à le télécharger séparément. Nécessite [LanternLoad](https://github.com/LanternMC/load) pour fonctionner.

<br>

# 📚 Explication du système
Toutes les 5 secondes, la librairie exécute à l'emplacement de chaque joueur les étapes suivantes :
* Exécuter le function tag `denied_dimensions` pour vous permettre de refuser que certaines dimensions soient scannées.
* Si la dimension est autorisée, 8 régions autour des joueurs sont scannées. (La taille par défaut des régions est 96x96)
* Pour chaque région, la librairie va vérifier si elle a déjà été scannée. Si non, elle lancera la génération de minerai pour cette région.
* Ensuite, le function tag `generate_ores` est appelé à l'origine de la région (0, 0, 0).
* Vous pouvez ajouter votre propre fonction de génération de minerai à ce function tag où vous générerez vos minerais en fonction de conditions que vous avez choisies. (comme les dimensions, les biomes, etc...)
* Pour chaque filon de minerai que vous générez, vous devez utiliser le function tag de position aléatoire `random_position` pour obtenir une position aléatoire à l'intérieur de la région. Ce function tag déplacera la position vers une position aléatoire et au bloc d'air le plus proche. En procédant ainsi, vous éviterez que les minerais soient générés à l'intérieur des blocs et ne soient jamais trouvés par les joueurs (ce qui ajoutera du lag au serveur si le minerai utilise une entité). Ainsi, les minerais seront plus faciles à trouver.
* Et après chaque vérification, la librairie sauvegardera la région comme "scannée" pour éviter qu'elle ne soit scannée à nouveau en ajoutant un `barrier block` à l'origine de la région.
* Enfin, le fonction tag `post_generation` est appelé pour vous permettre de faire quelques tâches post-génération, comme lancer une fonction sur tous vos minerais nouvellement générés pour leur ajouter des tags nbt ou autre chose.

<br>

# 🔧 Function Tag
## 📥 <ins>Signals</ins>
### `#smart_ore_generation:v1/denied_dimensions`
* Ce function tag est appelé lorsque la librairie veut scanner une région. Vous pouvez ajouter quelles dimensions que vous voulez empêcher d'être scannées en ajoutant une fonction à ce tag.
* Pour utiliser ce signal, vous devez ajouter une fonction à la liste de tags située dans `data/smart_ore_generation/tags/function/v1/signals/denied_dimensions.json`.
* Reportez-vous à ce modèle pour le contenu de la fonction [ici](https://github.com/Stoupy51/SmartOreGeneration/blob/main/build/datapack/data/smart_ore_generation/function/v1.5.0/signals/denied_dimensions.mcfunction).
```mcfunction
#> smart_ore_generation:v1.5.0/signals/denied_dimensions
#
# @within			#smart_ore_generation:v1/signals/denied_dimensions
# @executed			as & at le joueur qui a déclenché le signal
# @input score		#authorized smart_ore_generation.data égal à 1 ou 0 si un autre datapack a déjà refusé la génération
#
## WARNING!
# - Vous devez vérifier que le score #authorized vaut 1 avant d'exécuter des commandes pour éviter de réactiver la génération dans une dimension qui est désactivée par un autre datapack.
# - Mettre le score #authorized à 0 désactivera la génération dans la dimension pour tous les datapacks.

## Voici un exemple pour désactiver la génération dans une dimension :
execute if score #authorized smart_ore_generation.data matches 1 if predicate simplenergy:in_overworld run scoreboard players set #authorized smart_ore_generation.data 0

## Autre exemple :
execute if score #authorized smart_ore_generation.data matches 1 if dimension minecraft:overworld run scoreboard players set #authorized smart_ore_generation.data 0
```
### `#smart_ore_generation:v1/generate_ores`
* Ce function tag est appelé lorsque la librairie veut générer des minerais dans une région. Vous pouvez ajouter votre propre fonction de génération de minerai à ce tag.
* Pour utiliser ce signal, vous devez ajouter une fonction à la liste de tags située dans `data/smart_ore_generation/tags/function/v1/signals/generate_ores.json`.
* Référez-vous à ce modèle pour le contenu de la fonction [ici](https://github.com/Stoupy51/SmartOreGeneration/blob/main/build/datapack/data/smart_ore_generation/function/v1.5.0/signals/example/generate_ores.mcfunction)
```mcfunction
#> smart_ore_generation:v1.5.0/signals/generate_ores
#
# @within			#smart_ore_generation:v1/signals/generate_ores
# @executed			as un marker spécial & at une position dont vous ne devriez pas vous soucier
#
## WARNING!
# - Vous ne devez pas utiliser /kill @s dans ce fichier, ou la librairie entière cessera de fonctionner.
# - N'oubliez pas de modifier les scores #min_height et #max_height avant d'essayer de générer des minerais.
#
# @example from SimplEnergy datapack
# Cet exemple génère 4 filons de Simplunium Ore dans l'overworld uniquement.
# Par région et entre le point le plus bas du monde (minecraft par défaut : -64) et y=40

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
# Voir le modèle dans le lien pour le contenu de la fonction smart_ore_generation:v1.5.0/signals/example/simplunium_ore.mcfunction
```
### `#smart_ore_generation:v1/post_generation`
* Ce function tag est appelé lorsque la librairie a fini de générer des minerais dans les régions. Vous pouvez ajouter votre propre fonction de post-génération à ce tag.
* Pour utiliser ce signal, vous devez ajouter une fonction à la liste de tags située dans `data/smart_ore_generation/tags/function/v1/signals/post_generation.json`.
* Référez-vous à ce modèle pour le contenu de la fonction [ici](https://github.com/Stoupy51/SmartOreGeneration/blob/main/build/datapack/data/smart_ore_generation/function/v1.5.0/signals/example/post_generation.mcfunction)
```mcfunction
#> smart_ore_generation:v1.5.0/signals/post_generation
#
# @within			#smart_ore_generation:v1/signals/post_generation
# @executed			as none at none (default of a /schedule)
#
# Cette fonction est exécutée une fois après la génération de toutes les régions.
# Par exemple, si 6 régions sont générées, cette fonction sera exécutée 1 fois après la génération de toutes les régions.
# Elle peut être utilisée pour effectuer certaines tâches post-génération, comme exécuter une fonction sur tous les minerais que vous avez généré
# au lieu de l'exécuter sur chaque minerai individuellement lorsque vous le générez.
# Utile pour l'optimisation.
#
# @example from SimplEnergy datapack
# Cet exemple va éditer les nbt des entités pour les simplunium ore et deepslate simplunium ore
# si ils ont été générés tout au long du processus de génération.
# Ceci est utile pour l'optimisation car vous n'exécutez la fonction "secondary" qu'une seule fois
# au lieu de l'exécuter sur chaque minerai individuellement lorsque vous le générez.

# Place simplunium ore if it has been generated
execute if score #generated_ore simplenergy.data matches 1 as @e[tag=simplenergy.new_simplunium_ore] at @s run function simplenergy:place/simplunium_ore/secondary
execute if score #generated_ore simplenergy.data matches 1 run scoreboard players reset #generated_ore simplenergy.data

# Place deepslate simplunium ore if it has been generated
execute if score #generated_deepslate_ore simplenergy.data matches 1 as @e[tag=simplenergy.new_deepslate_simplunium_ore] at @s run function simplenergy:place/deepslate_simplunium_ore/secondary
execute if score #generated_deepslate_ore simplenergy.data matches 1 run scoreboard players reset #generated_deepslate_ore simplenergy.data
```
## 📤 <ins>Slots</ins>
### `#smart_ore_generation:v1/slots/random_position`
* Ce function tag doit être appelé lorsque vous avez besoin d'une position aléatoire dans la région.
* Pour utiliser correctement ce slot, voir le modèle [ici].(https://github.com/Stoupy51/SmartOreGeneration/blob/main/build/datapack/data/smart_ore_generation/function/v1.5.0/signals/example/simplunium_ore.mcfunction)
```mcfunction
#> smart_ore_generation:v1.5.0/signals/example/simplunium_ore
#
# @example from SimplEnergy datapack
# Exemple de comment trouver une position aléatoire dans une région pour générer un minerai
# Toujours lancer le function tag de position aléatoire avant tout
# @TIP: La position aléatoire n'est pas plate, elle a un chiffre après la virgule.
# Vous pouvez utiliser ce chiffre pour générer le minerai d'une certaine manière comme ci-dessous
# Il va essayer de placer le filon de minerai en fonction du chiffre
# donc sur chaque ligne ci-dessous, certaines peuvent échouer rendant cela plus réaliste
# résultant en un filon de minerai contenant entre 2 et 6 minerais (dans cet exemple)

## Essayer de trouver une position aléatoire adjacente à l'air dans la région pour générer le minerai.
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

## Comment l'utiliser ?
1. Utilisez un datapack merger : [Mitochrondria Online](https://mito.thenuclearnexus.live/)
2. Implémentez l'API comme décrit ci-dessus.

OU

1. Installez [LanternLoad](https://github.com/LanternMC/load) dans votre data pack
2. Copiez le dossier `data/smart_ore_generation` dans votre data pack
3. Fusionnez le contenu de `SmartOreGeneration/data/load/tags/function/load.json` et votre `data/load/tags/function/load.json`
4. Implémentez l'API comme décrit ci-dessus.

