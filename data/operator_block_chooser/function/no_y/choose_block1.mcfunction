# limit about of times this function can run for
execute if score #obc.choose_block_counter operator_block_chooser matches 127..254 run return run function operator_block_chooser:world_height

# need a block to perform operations on, this is to choose a block smartly
execute store result storage operator_block_chooser:choose_block coords.x int 1 run random value -16..15
data modify storage operator_block_chooser:choose_block coords.y set value -64
execute store result storage operator_block_chooser:choose_block coords.z int 1 run random value -16..15

function operator_block_chooser:no_y/choose_block2 with storage operator_block_chooser:choose_block coords
