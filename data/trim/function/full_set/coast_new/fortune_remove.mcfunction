execute as @a[tag=full_set_coast_got_fortune] run item modify entity @s weapon.mainhand trim:fortune_remove
execute as @a[tag=full_set_coast_got_fortune] run tag @s remove full_set_coast_got_fortune
# does this need to be scheduled?