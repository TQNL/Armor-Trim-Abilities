# Clear the earlier determine probe.
execute positioned -30000000 0 1800 run kill @e[type=item,distance=..2]

# Generate Fortune+1 loot at fixed scratch, while mining the candidate block at ~ ~ ~.
$loot spawn -30000000 0 1800 mine ~ ~ ~ diamond_pickaxe[enchantments={"minecraft:fortune":$(fortune_level)}]

# Copy generated count back to the original real item entity.
execute positioned -30000000 0 1800 run data modify entity @s Item.count set from entity @e[type=item,distance=..2,sort=nearest,limit=1] Item.count

# Clean up.
execute positioned -30000000 0 1800 run kill @e[type=item,distance=..2]
