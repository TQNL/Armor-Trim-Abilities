function operator_block_chooser:initial
execute positioned ~1 ~ ~ if function trim:full_set/coast/init_determine run return run function trim:full_set/coast/fortune2
execute positioned ~-1 ~ ~ if function trim:full_set/coast/init_determine run return run function trim:full_set/coast/fortune2
execute positioned ~ ~1 ~ if function trim:full_set/coast/init_determine run return run function trim:full_set/coast/fortune2
execute positioned ~ ~-1 ~ if function trim:full_set/coast/init_determine run return run function trim:full_set/coast/fortune2
execute positioned ~ ~ ~1 if function trim:full_set/coast/init_determine run return run function trim:full_set/coast/fortune2
execute positioned ~ ~ ~-1 if function trim:full_set/coast/init_determine run return run function trim:full_set/coast/fortune2
