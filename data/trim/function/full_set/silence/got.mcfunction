tag @s add full_set_silence
execute if items entity @s hotbar.* bow[minecraft:custom_data~{trim_abilities_sonic_boom:1b}] run return 0
execute if items entity @s inventory.* bow[minecraft:custom_data~{trim_abilities_sonic_boom:1b}] run return 0
give @s bow[unbreakable={},enchantments={"minecraft:infinity":1},custom_name='{"text":"Sonic Boom","italic":false}',custom_data={trim_abilities_sonic_boom:1b,trim_abilities_custom_item:1b}] 1
#tag @s add trim_got_item
