# implement coord redundancy mechanism like on sticky note!!!!!!!!!!!!!!!!!!!!!!!!!!
scoreboard players reset #trim_test_fortune trim_flag
scoreboard players reset #trim_test_block trim_flag

clone ~ ~ ~ ~ ~ ~ 5 -64 14
execute store result score #trim_test_block trim_flag run loot spawn 5 -64 14 mine ~ ~ ~

execute positioned 5 -64 14 run clone ~ ~ ~1 ~ ~ ~1 ~ ~ ~
execute if score #trim_test_block trim_flag matches 0 run return fail

execute store success score #trim_test_fortune trim_flag positioned 5 -64 14 run data modify entity @n[type=item,distance=..1] Item.id set from entity @s Item.id
execute if score #trim_test_fortune trim_flag matches 0 run return 1

execute positioned 5 -64 14 run kill @n[type=item,distance=..1]
scoreboard players reset #trim_test_fortune trim_flag
return fail