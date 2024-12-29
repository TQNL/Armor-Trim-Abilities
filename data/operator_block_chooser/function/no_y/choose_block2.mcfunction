# check if these random coords are desirable
$execute positioned $(x) $(y) $(z) if blocks ~ ~ ~ ~ ~ ~ ~1 ~ ~ all run return 1

# not, so increment counter and redo
scoreboard players add #obc.choose_block_counter operator_block_chooser 1
function operator_block_chooser:no_y/choose_block1
