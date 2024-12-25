scoreboard players reset @s trial_pot_broken
execute as @n[type=item,nbt={Item:{components:{"minecraft:custom_data":{trial_pot:1b}}}},distance=..7] at @s run loot spawn ~ ~ ~ loot minecraft:pots/trial_chambers/corridor
# this data pack alters decorated pots in trial chamber corridors in a way that makes other data packs that alter trial chamber generation not work properly
