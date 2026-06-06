execute as @a[tag=trim.single.wayfinder] if entity @s[tag=trim.single.raiser] if entity @s[tag=trim.single.shaper] if entity @s[tag=trim.single.host] run tag @s add trim.full_set.ascendant
execute as @a[tag=trim.full_set.ascendant] at @s run effect give @a[distance=..128] speed 7 0 true
execute as @a[tag=trim.full_set.ascendant] at @s run effect give @a[distance=..128] haste 7 0 true
execute as @a[tag=trim.full_set.ascendant] at @s run effect give @a[distance=..128] strength 7 0 true
execute as @a[tag=trim.full_set.ascendant] at @s run effect give @a[distance=..128] regeneration 7 0 true
schedule function trim:ascendant 6s replace
