# only works when you know that only one such item is there
data modify storage trim_abilities:reset_armor item.container set from entity @s Inventory

# handling
$data modify storage trim_abilities:reset_armor item.slot_type set value '$(slot_type)'
execute if data storage trim_abilities:reset_armor {item:{slot_type:'weapon.'}} run data modify storage trim_abilities:reset_armor item.slot_index set value 'offhand'
execute if data storage trim_abilities:reset_armor {item:{slot_type:'container.'}} store result storage trim_abilities:reset_armor item.slot_index int 1 run data get storage trim_abilities:reset_armor item.container[{components:{"minecraft:attribute_modifiers":[{id:"trim:safe_fall_distance"}]}}].Slot

# remove non-vanilla data
data modify storage trim_abilities:reset_armor item.components set from storage trim_abilities:reset_armor item.container[{components:{"minecraft:attribute_modifiers":[{id:"trim:safe_fall_distance"}]}}].components
data remove storage trim_abilities:reset_armor item.components."minecraft:attribute_modifiers"[{id:"trim:safe_fall_distance"}]

data remove storage trim_abilities:reset_armor item.components."minecraft:custom_data".trim_abilities
data remove storage trim_abilities:reset_armor item.components."minecraft:custom_data".single_flow

# test if no data from other sources and then clean components
data modify storage trim_abilities:reset_armor item.test."minecraft:custom_data" set from storage trim_abilities:reset_armor item.components."minecraft:custom_data"
execute store success score @s trim.flag run data modify storage trim_abilities:reset_armor item.test."minecraft:custom_data" set value {}
function trim:single/flow/replace_armor_data with storage trim_abilities:reset_armor item

data remove storage trim_abilities:reset_armor item
scoreboard players reset @s trim.flag
