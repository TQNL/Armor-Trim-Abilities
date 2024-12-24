advancement revoke @s only trim:trim_abilities/inv_change
execute if entity @s[gamemode=creative] run return 0
execute if entity @s[gamemode=spectator] run return 0

item replace entity @s player.crafting.0 with blaze_powder[enchantment_glint_override=true,custom_name='"Oxidize - Click with Copper Item"',custom_data={trim_abilities_bolting:1b,trim_abilities_oxidize:1b,trim_abilities_custom_item:1b},lore=['"Becomes a ghost item"','"when closing inventory :/"']] 64
item replace entity @s player.crafting.1 with blaze_powder[enchantment_glint_override=true,custom_name='"Oxidize - Click with Copper Item"',custom_data={trim_abilities_bolting:1b,trim_abilities_oxidize:1b,trim_abilities_custom_item:1b},lore=['"Becomes a ghost item"','"when closing inventory :/"']] 64
item replace entity @s player.crafting.2 with grindstone[enchantment_glint_override=true,custom_name='"Scrape - Click with Copper Item"',custom_data={trim_abilities_bolting:1b,trim_abilities_scrape:1b,trim_abilities_custom_item:1b},lore=['"Becomes a ghost item"','"when closing inventory :/"']] 64
item replace entity @s player.crafting.3 with grindstone[enchantment_glint_override=true,custom_name='"Scrape - Click with Copper Item"',custom_data={trim_abilities_bolting:1b,trim_abilities_scrape:1b,trim_abilities_custom_item:1b},lore=['"Becomes a ghost item"','"when closing inventory :/"']] 64
