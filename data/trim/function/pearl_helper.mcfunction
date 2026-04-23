tag @s add trim_assessed

$execute at @a[tag=single_eye,nbt={UUID:$(Owner)}] unless items entity @p container.* ender_pearl[minecraft:custom_data~{trim_abilities_unender_pearl:1b}] run give @p ender_pearl[enchantment_glint_override=1b,custom_name={"text":"Unender Pearl","italic":false},custom_data={trim_abilities_custom_item:1b,trim_abilities_unender_pearl:1b}]

$execute at @a[tag=full_set_eye,nbt={UUID:$(Owner)}] unless items entity @p container.* ender_pearl[minecraft:custom_data~{trim_abilities_unender_pearl:1b}] run function trim:full_set/eye/1
