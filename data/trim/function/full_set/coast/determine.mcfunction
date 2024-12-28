scoreboard players reset #trim_test_fortune trim_flag
scoreboard players reset #trim_test_block trim_flag

$clone ~ ~ ~ ~ ~ ~ $(x) -64 $(z)
$execute store result score #trim_test_block trim_flag run loot spawn $(x) -64 $(z) mine ~ ~ ~

$execute positioned $(x) -64 $(z) run clone ~ ~ ~1 ~ ~ ~1 ~ ~ ~
execute if score #trim_test_block trim_flag matches 0 run return fail

$execute store success score #trim_test_fortune trim_flag positioned $(x) -64 $(z) run data modify entity @n[type=item,distance=..1] Item.id set from entity @s Item.id
execute if score #trim_test_fortune trim_flag matches 0 run return 1

$execute positioned $(x) -64 $(z) run kill @n[type=item,distance=..1]
scoreboard players reset #trim_test_fortune trim_flag
return fail
