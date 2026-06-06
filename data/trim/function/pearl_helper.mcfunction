# executing as the owner at the pearl
tag @n[type=ender_pearl,distance=..1] add trim.assessed

# give pearl back
execute unless items entity @s container.* ender_pearl[minecraft:custom_data~{trim_abilities_unender_pearl:1b}] run give @s ender_pearl[enchantment_glint_override=1b,custom_name={"text":"Unender Pearl","italic":false},custom_data={trim_abilities_custom_item:1b,trim_abilities_unender_pearl:1b}]

# activate full set ability
execute if entity @s[tag=trim.full_set.eye] run function trim:full_set/eye/1

