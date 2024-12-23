summon item ~ ~ ~ {Tags:["trim_temp_item"],Item:{id:"minecraft:coal",Count:1b},Age:1s}
data modify entity @e[tag=trim_temp_item,sort=nearest,limit=1,distance=..1] Item.id set from entity @s Item.id
data modify entity @e[tag=trim_temp_item,sort=nearest,limit=1,distance=..1] Motion set from entity @s Motion
#execute as @e[tag=trim_temp_item,sort=nearest,limit=1,distance=..1] store result entity @s Item.Count byte 1 run random value 0..1
execute as @e[tag=trim_temp_item,nbt={Item:{id:"minecraft:raw_copper"}},sort=nearest,limit=1,distance=..1] store result entity @s Item.Count byte 1 run random value 2..5
execute as @e[tag=trim_temp_item,nbt={Item:{id:"minecraft:gold_nugget"}},sort=nearest,limit=1,distance=..1] store result entity @s Item.Count byte 1 run random value 2..6
execute as @e[tag=trim_temp_item,nbt={Item:{id:"minecraft:lapis_lazuli"}},sort=nearest,limit=1,distance=..1] store result entity @s Item.Count byte 1 run random value 4..9
execute as @e[tag=trim_temp_item,nbt={Item:{id:"minecraft:redstone"}},sort=nearest,limit=1,distance=..1] store result entity @s Item.Count byte 1 run random value 4..5
execute as @e[tag=trim_temp_item,nbt={Item:{id:"minecraft:amethyst_shard"}},sort=nearest,limit=1,distance=..1] run data merge entity @s {Item:{Count:4b}}
tag @e[tag=trim_temp_item,sort=nearest,limit=1,distance=..1] remove trim_temp_item
