scoreboard players reset @s panda_genes
execute unless entity @e[type=panda,distance=..50] run return 0
tellraw @s {"text": "Genes of the closest panda:"}
tellraw @s [{"text":"MainGene: "},{"nbt":"MainGene","entity":"@e[type=panda,sort=nearest,limit=1]","color":"green"}]
tellraw @s [{"text":"HiddenGene: "},{"nbt":"HiddenGene","entity":"@e[type=panda,sort=nearest,limit=1]","color":"green"}]