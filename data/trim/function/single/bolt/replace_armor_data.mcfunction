# introduce cleaned components
$item modify entity @s $(slot_type)$(slot_index) {"function":"minecraft:set_components","components":$(components)}

# remove custom data if found empty
$execute if score @s trim_flag matches 0 run item modify entity @s $(slot_type)$(slot_index) {function:"minecraft:set_components",components:{"!minecraft:custom_data":{}}}
