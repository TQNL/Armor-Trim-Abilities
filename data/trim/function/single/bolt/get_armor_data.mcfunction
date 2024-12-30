$data modify storage trim_abilities:reset_armor armor.$(part) set from entity @s Inventory[{components:{"minecraft:attribute_modifiers":{modifiers:[{id:"trim:attack_damage.$(part)"}]}}}]
$data remove storage trim_abilities:reset_armor armor.$(part).components."minecraft:attribute_modifiers".modifiers[{id:"trim:attack_damage.$(part)"}]
$data remove storage trim_abilities:reset_armor armor.$(part).components."minecraft:custom_data".trim_abilities
$data remove storage trim_abilities:reset_armor armor.$(part).components."minecraft:custom_data".single_bolt
item modify 
{"function":"minecraft:set_components","components":{"minecraft:attribute_modifiers":{"modifiers":[]},"minecraft:banner_patterns":[]},"conditions":[]}