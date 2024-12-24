# setup
summon item_display ~ ~ ~ {Tags:['trim_abilities_item_placeholder']}
$item replace entity @n[type=item_display,tag=trim_abilities_item_placeholder] contents from entity @p player.crafting.$(slot)
data modify storage trim_abilities:copper_bolting root set from entity @n[type=item_display,tag=trim_abilities_item_placeholder] item
kill @n[type=item_display,tag=trim_abilities_item_placeholder]
execute if data storage trim_abilities:copper_bolting root.components run return run data remove storage trim_abilities:copper_bolting root

$data modify storage trim_abilities:copper_bolting root.slot set value $(slot)

data modify storage trim_abilities:copper_bolting root.id set string storage trim_abilities:copper_bolting root.id 10

# string manipulation - check for '_block' appendage for (waxed) copper blocks
data modify storage trim_abilities:copper_bolting root.test_string set string storage trim_abilities:copper_bolting root.id -6
data modify storage trim_abilities:copper_bolting root.reference_string set value '_block'
execute store success score #_block trim_flag run data modify storage trim_abilities:copper_bolting root.test_string set from storage trim_abilities:copper_bolting root.reference_string

execute if score #_block trim_flag matches 0 run data modify storage trim_abilities:copper_bolting root.id set string storage trim_abilities:copper_bolting root.id 0 -6

# string manipulation - check for 'waxed_'
data modify storage trim_abilities:copper_bolting root.test_string set string storage trim_abilities:copper_bolting root.id 0 6
data modify storage trim_abilities:copper_bolting root.reference_string set value 'waxed_'
execute store success score #waxed_ trim_flag run data modify storage trim_abilities:copper_bolting root.test_string set from storage trim_abilities:copper_bolting root.reference_string

execute if score #waxed_ trim_flag matches 1 run data modify storage trim_abilities:copper_bolting root.wax_flag set value ''
execute if score #waxed_ trim_flag matches 1 run data modify storage trim_abilities:copper_bolting root.modded_id set from storage trim_abilities:copper_bolting root.id
execute if score #waxed_ trim_flag matches 1 if function trim:full_set/bolt/copper_bolting/block_test_init run function trim:full_set/bolt/copper_bolting/2
execute if score #waxed_ trim_flag matches 0 run data modify storage trim_abilities:copper_bolting root.wax_flag set value 'waxed_'
execute if score #waxed_ trim_flag matches 0 run data modify storage trim_abilities:copper_bolting root.modded_id set string storage trim_abilities:copper_bolting root.id 6
execute if score #waxed_ trim_flag matches 0 run function trim:full_set/bolt/copper_bolting/2

# end
item replace entity @s player.cursor with air
scoreboard players reset * trim_flag
