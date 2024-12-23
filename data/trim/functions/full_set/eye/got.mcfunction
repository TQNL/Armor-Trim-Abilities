tag @s add full_set_eye
execute unless entity @s[tag=trim_got_item] run give @s ender_pearl{display:{Name:'{"text":"Unender Pearl","italic":false}'},trimdatapack:1b,Enchantments:[{}]}
tag @s add trim_got_item