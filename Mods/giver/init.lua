
-- Mod Name 		: giver
-- Mod Description 	: simple mod to give the players what you want on joining the server, useful while developing mods, testing recipes, etc.
-- Mod Author		: DouGy

minetest.register_on_joinplayer(function(player)
	-- Items and blocks id's can be found on the minetest site : http://wiki.minetest.net/Main_Page
	-- Try the search bar in the top-right corner ;)
	player:get_inventory():add_item("main", "default:steel_ingot 50") -- gives 50 steel ingots
end)
