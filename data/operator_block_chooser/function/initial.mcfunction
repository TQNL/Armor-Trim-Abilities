# most worlds have a depth to -64, with a bedrock bottom. if this is the case and 0 -64 0 isn't used for anything in this cycle of functions,
# then 0 -64 0 is perfectly suitable and then we can skip this whole mess

# READ ME: for cloning back to replace the block back to the original state, take from positive X (~1 ~ ~)

# easy route
execute unless block 0 -64 0 bedrock run return run function operator_block_chooser:no_y/choose_block1
execute unless block 0 -64 1 bedrock run return run function operator_block_chooser:no_y/choose_block1

# is y = -64 out of this world?
execute positioned 0 -64 0 unless function operator_block_chooser:out_of_world run return run function operator_block_chooser:world_height

# easy route - done
scoreboard players reset #obc.choose_block_counter operator_block_chooser
data modify storage operator_block_chooser:choose_block coords.x set value 0
data modify storage operator_block_chooser:choose_block coords.y set value -64
data modify storage operator_block_chooser:choose_block coords.z set value 0
