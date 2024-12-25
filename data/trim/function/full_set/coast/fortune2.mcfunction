summon item ~ ~ ~ {Tags:["trim_temp_item"],Item:{id:"minecraft:coal",count:1},Age:1s}
data modify entity @n[tag=trim_temp_item,distance=..1] Item.id set from entity @s Item.id
data modify entity @n[tag=trim_temp_item,distance=..1] Motion set from entity @s Motion
#execute as @n[tag=trim_temp_item,distance=..1] store result entity @s Item.count int 1 run random value 0..1
execute as @n[tag=trim_temp_item,nbt={Item:{id:"minecraft:raw_copper"}},distance=..1] store result entity @s Item.count int 1 run random value 2..5
execute as @n[tag=trim_temp_item,nbt={Item:{id:"minecraft:gold_nugget"}},distance=..1] store result entity @s Item.count int 1 run random value 2..6
execute as @n[tag=trim_temp_item,nbt={Item:{id:"minecraft:lapis_lazuli"}},distance=..1] store result entity @s Item.count int 1 run random value 4..9
execute as @n[tag=trim_temp_item,nbt={Item:{id:"minecraft:redstone"}},distance=..1] store result entity @s Item.count int 1 run random value 4..5
execute as @n[tag=trim_temp_item,nbt={Item:{id:"minecraft:amethyst_shard"}},distance=..1] run data merge entity @s {Item:{count:4}}
tag @n[tag=trim_temp_item,distance=..1] remove trim_temp_item
