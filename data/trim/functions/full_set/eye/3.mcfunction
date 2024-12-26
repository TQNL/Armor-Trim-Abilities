# raycast done
execute unless block ~ ~ ~ #trim:air positioned ~ ~0.1 ~ align xyz run tp @s ~0.5 ~ ~0.5
execute unless block ~ ~ ~ #trim:air positioned ~ ~0.1 ~ align xyz run return 0

# further raycast, in unsuccesful case
execute positioned ~ ~-0.1 ~ run function trim:full_set/eye/3
