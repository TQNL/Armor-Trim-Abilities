scoreboard players reset #obc.wh operator_block_chooser

# limit about of times this function can run for: at 254 iterations, y is above maxiumum y can be
execute if score #obc.choose_block_counter operator_block_chooser matches 254.. run return run function operator_block_chooser:force

# need a block to perform operations on, this is to choose a block smartly
execute store result storage operator_block_chooser:choose_block coords.x int 1 run random value -16..15
## y is choosen already
execute store result storage operator_block_chooser:choose_block coords.z int 1 run random value -16..15

function operator_block_chooser:with_y/choose_block2 with storage operator_block_chooser:choose_block coords
