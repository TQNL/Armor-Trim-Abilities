summon item_display ~ ~ ~ {Tags:['trim_abilities_item_placeholder']}
$item replace entity @n[type=item_display,tag=trim_abilities_item_placeholder] contents from entity @p $(type).$(slot)
data remove entity @n[type=item_display] item.components."minecraft:attribute_modifiers".modifiers[{id:"trim:safe_fall_distance.head"}]
data remove entity @n[type=item_display] item.components."minecraft:attribute_modifiers".modifiers[{id:"trim:safe_fall_distance.chest"}]
data remove entity @n[type=item_display] item.components."minecraft:attribute_modifiers".modifiers[{id:"trim:safe_fall_distance.legs"}]
data remove entity @n[type=item_display] item.components."minecraft:attribute_modifiers".modifiers[{id:"trim:safe_fall_distance.feet"}]
data remove entity @n[type=item_display] item.components."minecraft:custom_data".single_flow
data remove entity @n[type=item_display] item.components."minecraft:custom_data".trim_abilities
$item replace entity @s $(type).$(slot) from entity @n[type=item_display] contents
kill @n[type=item_display]
scoreboard players reset @s trim_flow_slot
data remove storage trim_abilities:flow_armor field
