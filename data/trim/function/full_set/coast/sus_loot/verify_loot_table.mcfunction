$execute store success score #trim_test_sus_block trim.coast run loot spawn ~ ~-200 ~ loot trim:$(sus_block)
execute positioned ~ ~-200 ~ run kill @n[type=item,distance=..1]
return 1
