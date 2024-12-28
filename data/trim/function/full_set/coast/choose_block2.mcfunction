data remove storage trim_abilities:choose_block coords
$execute positioned $(x) -64 $(z) if blocks ~ ~ ~ ~ ~ ~ ~1 ~ ~ all run return run function trim:full_set/coast/determine {x:$(x),z:$(z)}

scoreboard players add #trim_choose_block_counter trim_flag 1
function trim:full_set/coast/choose_block
