scoreboard players reset @s trial_pot_broken
execute unless entity @s[tag=full_set_coast] run return 0
execute as @n[type=item,nbt={Item:{components:{"minecraft:custom_data":{trial_pot:1b}}}},distance=..7] at @s run loot spawn ~ ~ ~ loot minecraft:pots/trial_chambers/corridor
