# limit about of times this function can run for
execute if score #trim_choose_block_counter trim_flag matches 100.. run return run function trim:full_set/coast/determine {x:5,z:14}

# need a block to perform operations on, this is to choose a block smartly
execute if blocks 5 -64 14 5 -64 14 6 -64 14 all run return run function trim:full_set/coast/determine {x:5,z:14}

execute store result storage trim_abilities:choose_block coords.x int 1 run random value 0..15
execute store result storage trim_abilities:choose_block coords.z int 1 run random value 0..15

return run function trim:full_set/coast/choose_block2 with storage trim_abilities:choose_block coords

