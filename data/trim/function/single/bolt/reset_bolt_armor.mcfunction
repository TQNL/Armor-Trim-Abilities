# copy inventory
# remove slots with the trim signature
# copy over nbt, pairing slot id and slot word together
data modify storage trim_abilities:reset_armor slot.part

execute if data entity @s Inventory[{components:{"minecraft:attribute_modifiers":{modifiers:[{id:"trim:attack_damage.head"}]}}}] run function trim:single/bolt/get_armor_data {part:"head"}
execute if data entity @s Inventory[{components:{"minecraft:attribute_modifiers":{modifiers:[{id:"trim:attack_damage.chest"}]}}}] run function trim:single/bolt/get_armor_data {part:"chest"}
execute if data entity @s Inventory[{components:{"minecraft:attribute_modifiers":{modifiers:[{id:"trim:attack_damage.legs"}]}}}] run function trim:single/bolt/get_armor_data {part:"legs"}
execute if data entity @s Inventory[{components:{"minecraft:attribute_modifiers":{modifiers:[{id:"trim:attack_damage.feet"}]}}}] run function trim:single/bolt/get_armor_data {part:"feet"}

