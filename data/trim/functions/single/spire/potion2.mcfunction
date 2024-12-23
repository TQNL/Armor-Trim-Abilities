effect clear @p[tag=single_spire,distance=..8.3] levitation
effect give @p[tag=single_spire,distance=..6] slow_falling 1
execute if entity @p[distance=6..] run kill @s
data modify entity @s Pos set from entity @p Pos