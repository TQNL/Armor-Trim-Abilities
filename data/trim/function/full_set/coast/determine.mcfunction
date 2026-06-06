# Executed as the real dropped item, positioned at the candidate source block.

scoreboard players reset #trim_test_fortune trim.coast
scoreboard players reset #trim_test_block trim.coast

# Clear old probe loot at the fixed scratch position.
execute positioned -30000000 0 1800 run kill @e[type=item,distance=..2]

# Generate normal candidate-block loot at the off-world scratch position.
execute store result score #trim_test_block trim.coast run loot spawn -30000000 0 1800 mine ~ ~ ~

# If the block drops nothing, fail.
execute if score #trim_test_block trim.coast matches 0 run return fail

# Compare probe item ID to the real dropped item ID.
execute store success score #trim_test_fortune trim.coast positioned -30000000 0 1800 run data modify entity @n[type=item,distance=..2] Item.id set from entity @s Item.id

# If data modify did nothing, IDs were already equal, so this candidate block matches.
execute if score #trim_test_fortune trim.coast matches 0 run return 1

# Otherwise clean up and fail.
execute positioned -30000000 0 1800 run kill @e[type=item,distance=..2]
scoreboard players reset #trim_test_fortune trim.coast
return fail
