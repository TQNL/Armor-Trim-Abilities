# refill slot at the end

summon item_display ~ ~ ~ {Tags:['trim_abilities_item_placeholder']}
$item replace entity @n[type=item_display,tag=trim_abilities_item_placeholder] contents from entity @p player.crafting.$(slot)
data modify storage trim_abilities:copper_bolting field set from entity @n[type=item_display,tag=trim_abilities_item_placeholder] item
kill @n[type=item_display,tag=trim_abilities_item_placeholder]
execute if data storage trim_abilities:copper_bolting field.components run return run data remove storage trim_abilities:copper_bolting field

# string manipulation - check
data modify storage trim_abilities:copper_bolting field.test_string set string storage trim_abilities:copper_bolting field.id 0 6
data modify storage trim_abilities:copper_bolting field.reference_string set value 'waxed_'

data modify