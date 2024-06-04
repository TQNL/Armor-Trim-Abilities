tag @s add single_eye
execute unless entity @s[tag=trim_got_item] run give @s ender_pearl{display:{Name:'{"text":"Unender Pearl","italic":false}'},trim_abilities:1b,trimdatapack:1b,Enchantments:[{}]}
tag @s add trim_got_item