tag @s add single_bolt
execute if items entity @s armor.head *[minecraft:trim~{pattern:"minecraft:bolt"}] run item modify entity @s armor.head [{"function":"minecraft:set_attributes","replace":false,"modifiers":[{"id":"trim:attack_damage","attribute":"minecraft:generic.attack_damage","amount":0.5,"operation":"add_value","slot":"head"}]},{"function":"minecraft:set_custom_data","tag":"{single_bolt:{head:1b}}"}]
execute if items entity @s armor.chest *[minecraft:trim~{pattern:"minecraft:bolt"}] run item modify entity @s armor.chest [{"function":"minecraft:set_attributes","replace":false,"modifiers":[{"id":"trim:attack_damage","attribute":"minecraft:generic.attack_damage","amount":0.5,"operation":"add_value","slot":"chest"}]},{"function":"minecraft:set_custom_data","tag":"{single_bolt:{chest:1b}}"}]
execute if items entity @s armor.legs *[minecraft:trim~{pattern:"minecraft:bolt"}] run item modify entity @s armor.legs [{"function":"minecraft:set_attributes","replace":false,"modifiers":[{"id":"trim:attack_damage","attribute":"minecraft:generic.attack_damage","amount":0.5,"operation":"add_value","slot":"legs"}]},{"function":"minecraft:set_custom_data","tag":"{single_bolt:{legs:1b}}"}]
execute if items entity @s armor.feet *[minecraft:trim~{pattern:"minecraft:bolt"}] run item modify entity @s armor.feet [{"function":"minecraft:set_attributes","replace":false,"modifiers":[{"id":"trim:attack_damage","attribute":"minecraft:generic.attack_damage","amount":0.5,"operation":"add_value","slot":"feet"}]},{"function":"minecraft:set_custom_data","tag":"{single_bolt:{feet:1b}}"}]
# doesn't need to get removed, and disabling the data pack is not my problem
