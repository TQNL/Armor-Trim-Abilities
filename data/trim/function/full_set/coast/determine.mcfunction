scoreboard players reset #trim_test_fortune operator_block_chooser
scoreboard players reset #trim_test_block operator_block_chooser

$clone ~ ~ ~ ~ ~ ~ $(x) $(y) $(z)
$execute store result score #trim_test_block operator_block_chooser run loot spawn $(x) $(y) $(z) mine ~ ~ ~

$execute positioned $(x) $(y) $(z) run clone ~ ~ ~1 ~ ~ ~1 ~ ~ ~
execute if score #trim_test_block operator_block_chooser matches 0 run return fail

$execute store success score #trim_test_fortune operator_block_chooser positioned $(x) $(y) $(z) run data modify entity @n[type=item,distance=..1] Item.id set from entity @s Item.id
execute if score #trim_test_fortune operator_block_chooser matches 0 run return 1

$execute positioned $(x) $(y) $(z) run kill @n[type=item,distance=..1]
scoreboard players reset #trim_test_fortune operator_block_chooser
return fail
