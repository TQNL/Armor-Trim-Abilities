$execute if score @s trim_flow_slot matches 1..9 run function trim:update_trim_ability/reset_flow_armor/1 {slot:$(slot),type:$(type)}
$execute if score @s trim_flow_slot matches 10.. run function trim:update_trim_ability/reset_flow_armor/1 {slot:$(slot),type:$(type)}
execute if score @s trim_flow_slot matches -106 run function trim:update_trim_ability/reset_flow_armor/1_offhand
