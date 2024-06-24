tag @s add single_eye
execute if items entity @s hotbar.* ender_pearl[minecraft:custom_data~{trim_abilities_unender_pearl:1b}] run return 0
execute if items entity @s inventory.* ender_pearl[minecraft:custom_data~{trim_abilities_unender_pearl:1b}] run return 0
give @s ender_pearl[enchantment_glint_override=1b,custom_name='{"text":"Unender Pearl","italic":false}',custom_data={trim_abilities_custom_item:1b,trim_abilities_unender_pearl:1b}]
#tag @s add trim_got_item