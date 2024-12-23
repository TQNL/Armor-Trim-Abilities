$setblock ~ ~ ~ command_block{TrackOutput:1b,auto:1b,Command:"$(command)"} replace
summon area_effect_cloud ~ ~ ~ {WaitTime:20,Tags:["trim_find_way_command"],Particle : "block air"}
schedule function trim:single/wayfinder/find3 2t append
