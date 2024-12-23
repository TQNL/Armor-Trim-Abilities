tag @s add single_eye
execute unless entity @s[tag=trim_got_item] run give @s ender_pearl[enchantment_glint_override=1b,custom_name='{"text":"Unender Pearl","italic":false}',custom_data={trim_abilities_custom_item:1b,trim_abilities_unender_pearl:1b}]
tag @s add trim_got_item