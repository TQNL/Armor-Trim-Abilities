execute positioned -30000000 0 1800 run forceload add ~ ~
execute positioned ~1 ~ ~ if function trim:full_set/coast/determine run return run function trim:full_set/coast/fortune2
execute positioned ~-1 ~ ~ if function trim:full_set/coast/determine run return run function trim:full_set/coast/fortune2
execute positioned ~ ~1 ~ if function trim:full_set/coast/determine run return run function trim:full_set/coast/fortune2
execute positioned ~ ~-1 ~ if function trim:full_set/coast/determine run return run function trim:full_set/coast/fortune2
execute positioned ~ ~ ~1 if function trim:full_set/coast/determine run return run function trim:full_set/coast/fortune2
execute positioned ~ ~ ~-1 if function trim:full_set/coast/determine run return run function trim:full_set/coast/fortune2
execute positioned -30000000 0 1800 run forceload remove ~ ~
