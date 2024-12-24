# 'modded_id' is the block/item id without 'waxed_' appended. if it was waxed or not is stored in 'wax_flag'

# determine what substring is infront: 'oxidized_', 'weathered_', 'exposed_' or none of the above
data modify storage trim_abilities:copper_bolting root.test_string set string storage trim_abilities:copper_bolting root.modded_id 0 9
data modify storage trim_abilities:copper_bolting root.degredation_level set value 'oxidized_'
execute store success score #degredation_level trim_flag run data modify storage trim_abilities:copper_bolting root.test_string set from storage trim_abilities:copper_bolting root.degredation_level

execute if score #degredation_level trim_flag matches 0 run data modify storage trim_abilities:copper_bolting root.base_id set string storage trim_abilities:copper_bolting root.modded_id 9
execute if score #degredation_level trim_flag matches 0 run return run function #trim:bolt_operations with storage trim_abilities:copper_bolting root


data modify storage trim_abilities:copper_bolting root.test_string set string storage trim_abilities:copper_bolting root.modded_id 0 10
data modify storage trim_abilities:copper_bolting root.degredation_level set value 'weathered_'
execute store success score #degredation_level trim_flag run data modify storage trim_abilities:copper_bolting root.test_string set from storage trim_abilities:copper_bolting root.degredation_level

execute if score #degredation_level trim_flag matches 0 run data modify storage trim_abilities:copper_bolting root.base_id set string storage trim_abilities:copper_bolting root.modded_id 10
execute if score #degredation_level trim_flag matches 0 run return run function #trim:bolt_operations with storage trim_abilities:copper_bolting root


data modify storage trim_abilities:copper_bolting root.test_string set string storage trim_abilities:copper_bolting root.modded_id 0 8
data modify storage trim_abilities:copper_bolting root.degredation_level set value 'exposed_'
execute store success score #degredation_level trim_flag run data modify storage trim_abilities:copper_bolting root.test_string set from storage trim_abilities:copper_bolting root.degredation_level

execute if score #degredation_level trim_flag matches 0 run data modify storage trim_abilities:copper_bolting root.base_id set string storage trim_abilities:copper_bolting root.modded_id 8
execute if score #degredation_level trim_flag matches 0 run return run function #trim:bolt_operations with storage trim_abilities:copper_bolting root


data modify storage trim_abilities:copper_bolting root.degredation_level set value 'none'
data modify storage trim_abilities:copper_bolting root.base_id set string storage trim_abilities:copper_bolting root.modded_id
function #trim:bolt_operations with storage trim_abilities:copper_bolting root
