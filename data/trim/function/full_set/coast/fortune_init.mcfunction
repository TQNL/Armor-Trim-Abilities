# wrapper for fortune functions to forceload world border chunk
execute positioned -30000000 0 1800 run forceload add ~ ~
function trim:full_set/coast/fortune
execute positioned -30000000 0 1800 run forceload remove ~ ~
