$loot spawn ~ ~ ~ mine ~ ~ ~ diamond_pickaxe[enchantments={levels:{"minecraft:fortune":$(fortune_level)}}]
data modify entity @s Item.count set from entity @n[type=item,distance=..1] Item.count
kill @n[type=item,distance=..1]
