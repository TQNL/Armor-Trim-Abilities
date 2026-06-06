scoreboard players reset @s trim.trial_pot
execute unless entity @s[tag=trim.full_set.coast] run return 0
execute as @n[type=item,nbt={Item:{components:{"minecraft:custom_data":{trial_pot:1b}}}},distance=..7] at @s run loot spawn ~ ~ ~ loot minecraft:pots/trial_chambers/corridor
