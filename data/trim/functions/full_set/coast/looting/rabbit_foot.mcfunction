# Drowned drop 0–(2+looting lvl) rotten flesh, mimick looting lvl +1 by add
execute unless entity @p[predicate=trim:holding_looting1] unless entity @p[predicate=trim:holding_looting2] unless entity @p[predicate=trim:holding_looting3] store result score @s trim_math1 run random value 1..17
execute unless entity @p[predicate=trim:holding_looting1] unless entity @p[predicate=trim:holding_looting2] unless entity @p[predicate=trim:holding_looting3] store result score @s trim_math1 if score @s trim_math1 matches 1 run summon item ~ ~ ~ {Item:{id:"minecraft:rabbit_foot",Count:1b},Age:1s}
execute if entity @p[predicate=trim:holding_looting1] store result score @s trim_math1 run random value 1..11
execute if entity @p[predicate=trim:holding_looting1] if score @s trim_math1 matches 1 run summon item ~ ~ ~ {Item:{id:"minecraft:rabbit_foot",Count:1b},Age:1s}
execute if entity @p[predicate=trim:holding_looting2] store result score @s trim_math1 run random value 1..8
execute if entity @p[predicate=trim:holding_looting2] if score @s trim_math1 matches 1 run summon item ~ ~ ~ {Item:{id:"minecraft:rabbit_foot",Count:1b},Age:1s}
execute if entity @p[predicate=trim:holding_looting3] store result score @s trim_math1 run random value 1..7
execute if entity @p[predicate=trim:holding_looting3] if score @s trim_math1 matches 1 run summon item ~ ~ ~ {Item:{id:"minecraft:rabbit_foot",Count:1b},Age:1s}
