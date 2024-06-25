$execute summon item_display run item replace entity @s contents from entity @p $(type).$(slot)
data remove entity @n[type=item_display] item.components."minecraft:attribute_modifiers".modifiers[{id:"trim:safe_fall_distance"}]
data remove entity @n[type=item_display] item.components."minecraft:custom_data".single_flow
execute as @n[type=item_display] if data entity @s {item:{components:{"minecraft:attribute_modifiers":{modifiers:[{type:"minecraft:generic.armor"},{type:"minecraft:generic.armor_toughness"},{type:"minecraft:generic.knockback_resistance"}]}}}} run function trim:update_trim_ability/reset_flow_armor/2
clear @s *[minecraft:custom_data~{single_flow:1b}]
$item replace entity @s $(type).$(slot) from entity @n[type=item_display] contents
kill @n[type=item_display]
#scoreboard players reset @s trim_flow_slot
data remove storage trim_abilities:flow_armor slot
