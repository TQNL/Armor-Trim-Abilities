$execute if data storage trim_abilities:copper_bolting {root:{degredation_level:'none'}} run data modify storage trim_abilities:copper_bolting root.command set value 'item replace entity @s player.crafting.$(slot) with $(wax_flag)exposed_$(base_id) $(count)'
$execute if data storage trim_abilities:copper_bolting {root:{degredation_level:'exposed_'}} run data modify storage trim_abilities:copper_bolting root.command set value 'item replace entity @s player.crafting.$(slot) with $(wax_flag)weathered_$(base_id) $(count)'
$execute if data storage trim_abilities:copper_bolting {root:{degredation_level:'weathered_'}} run data modify storage trim_abilities:copper_bolting root.command set value 'item replace entity @s player.crafting.$(slot) with $(wax_flag)oxidized_$(base_id) $(count)'
$execute if data storage trim_abilities:copper_bolting {root:{degredation_level:'oxidized_'}} run data modify storage trim_abilities:copper_bolting root.command set value 'item replace entity @s player.crafting.$(slot) with $(wax_flag)oxidized_$(base_id) $(count)'

function trim:full_set/bolt/copper_bolting/execute with storage trim_abilities:copper_bolting root
