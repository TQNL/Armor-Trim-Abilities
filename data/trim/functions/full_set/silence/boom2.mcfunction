particle minecraft:sonic_boom ~ ~ ~ 0.125 0.125 0.125 1 1 force
execute as @e[distance=..2,tag=!trim_boomer] if data entity @s Brain run damage @s 8 sonic_boom by @p[tag=trim_boomer]
schedule function trim:full_set/silence/boom3 1t replace