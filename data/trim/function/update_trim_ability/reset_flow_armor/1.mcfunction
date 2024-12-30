summon item_display ~ ~ ~ {Tags:['trim_abilities_item_placeholder']}
$item replace entity @n[type=item_display,tag=trim_abilities_item_placeholder] contents from entity @p $(type).$(slot)
data remove entity @n[type=item_display,tag=trim_abilities_item_placeholder] item.components."minecraft:attribute_modifiers".modifiers[{id:"trim:safe_fall_distance"}]
data remove entity @n[type=item_display,tag=trim_abilities_item_placeholder] item.components."minecraft:attribute_modifiers".modifiers[{id:"trim:safe_fall_distance"}]
data remove entity @n[type=item_display,tag=trim_abilities_item_placeholder] item.components."minecraft:attribute_modifiers".modifiers[{id:"trim:safe_fall_distance"}]
data remove entity @n[type=item_display,tag=trim_abilities_item_placeholder] item.components."minecraft:attribute_modifiers".modifiers[{id:"trim:safe_fall_distance"}]
data remove entity @n[type=item_display,tag=trim_abilities_item_placeholder] item.components."minecraft:custom_data".single_flow
data remove entity @n[type=item_display,tag=trim_abilities_item_placeholder] item.components."minecraft:custom_data".trim_abilities

data modify storage trim_abilities:test braces set from entity @n[type=item_display,tag=trim_abilities_item_placeholder] item.components."minecraft:custom_data"
execute store success score #trim_test_empty trim_flag run data modify storage trim_abilities:test braces set value {}
execute if score #trim_test_empty trim_flag matches 0 run data remove entity @n[type=item_display,tag=trim_abilities_item_placeholder] item.components."minecraft:custom_data"
data remove storage trim_abilities:test braces

$item replace entity @s $(type).$(slot) from entity @n[type=item_display,tag=trim_abilities_item_placeholder] contents
kill @n[type=item_display,tag=trim_abilities_item_placeholder]
scoreboard players reset @s trim_flow_slot
data remove storage trim_abilities:flow_armor field
