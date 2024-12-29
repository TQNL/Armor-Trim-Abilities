execute if score #obc.wh operator_block_chooser matches -2032.. run scoreboard players add #obc.wh operator_block_chooser 16
execute unless score #obc.wh operator_block_chooser matches -2032.. run scoreboard players set #obc.wh operator_block_chooser -2032
execute store result storage operator_block_chooser:choose_block coords.y int 1 run scoreboard players get #obc.wh operator_block_chooser

execute if function operator_block_chooser:init_w_h run return run function operator_block_chooser:with_y/choose_block1

function operator_block_chooser:world_height
