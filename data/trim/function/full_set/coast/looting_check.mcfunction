execute at @p as @n[type=fishing_bobber] on origin if entity @s[distance=..1] run return 0

# if they are accompanied by the random_chance_with_looting condition in the mob's loot table.

#holding gear (armor, tridents, weapons...)
#   - cant check from which gear the mob had, so that functionaltity is missing

#drowned: copper ingot
execute if entity @s[nbt={Item:{id:"minecraft:rotten_flesh",count:1}}] if block ~ ~ ~ water if block ~ ~1 ~ water unless entity @e[type=item,nbt={Item:{id:"minecraft:copper_ingot"}},distance=..1] run function trim:full_set/coast/looting/copper
#(elder) guardian: fish (loottable) and prismarine crystals - cant be bothered
#rabbit: foot
execute if entity @s[nbt={Item:{id:"minecraft:rabbit",count:1}}] run function trim:full_set/coast/looting/rabbit_foot
#shulker: shell - same as the gear mobs are wearing
#wither skeleton: skull
execute if entity @s[nbt={Item:{id:"minecraft:coal",count:1}}] run function trim:full_set/coast/looting/wiske_skull
#zombie (villager)/husk: iron ingot; carrot - cant be bothered
#zombie piglin: gold ingot
execute if entity @s[nbt={Item:{id:"minecraft:gold_nugget",count:1}}] run function trim:full_set/coast/looting/gold_ingot