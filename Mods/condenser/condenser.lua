local water_generation_delay_in_seconds = 3.0

-- Recipes --
-- TODO : Make a coherent "real" recipe

minetest.register_craft({
	type = "shapeless",
	output = "condenser:condenser",
	recipe = {"default:sand"}
})

minetest.register_craft({
	type = "shapeless",
	output = "condenser:condenser",
	recipe = {"default:dirt"}
})

-- Event Handlers --

function on_condenser_construct(pos, water)
	local meta = minetest.get_meta(pos)
	meta:set_int("water", water)
	local enabled = "true"
	if water == 0 then
		enabled = "false"
	end
	meta:set_string("enabled", enabled)
end

function on_condenser_rightclick(pos, node, player, itemstack, pointed_thing)
	local meta = minetest.get_meta(pos)
	local enabled = meta:get_string("enabled")
	if enabled == "false" then
		enabled = "true"
	else
		enabled = "false"
	end
	meta:set_string("enabled", enabled)
	local str_enabled = "disabled"
	if enabled == "true" then
		str_enabled = "enabled"
	end
	minetest.chat_send_player(player:get_player_name(), "Condenser : "..str_enabled)
end

function on_condenser_punch(pos, node, player, pointed_thing)
	local meta = minetest.get_meta(pos)
	local water = meta:get_int("water")
	if water > 0 then
		local enabled = meta:get_string("enabled")
		minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "condenser:condenser"})
		player:get_inventory():add_item("main", "water_source "..water)
		meta:set_int("water", 0)
		meta:set_string("enabled", enabled)
		minetest.chat_send_player(player:get_player_name(), "Condenser : Collected "..water.." water")
	else
		minetest.chat_send_player(player:get_player_name(), "Condenser : empty")
	end
end

-- ABM --

minetest.register_abm({
	nodenames = {"condenser:condenser", "condenser:condenser_1", "condenser:condenser_2", "condenser:condenser_3", "condenser:condenser_4", "condenser:condenser_5", "condenser:condenser_6", "condenser:condenser_7", "condenser:condenser_8"},
	neighbors = {"air"},
	interval = water_generation_delay_in_seconds,
	chance = 1,
	action = function(pos, node, active_object_water, active_object_water_wider)
		local meta = minetest.get_meta(pos)
		local enabled = meta:get_string("enabled")
		local water = meta:get_int("water")
		if enabled == "true" then
			water = water + 1
			if water > 8 then
				water = 8
				minetest.add_item({x = pos.x, y = pos.y + 1, z = pos.z}, "water_source")
			else
				minetest.set_node({x = pos.x, y = pos.y, z = pos.z}, {name = "condenser:condenser_"..water})
			end
			meta:set_int("water", water)
		end
	end
})

-- Nodes --

minetest.register_node("condenser:condenser_8", {
	description = "Condenser : 8 water",
	tiles = {
		"condenser_condenser_up.png",
		"condenser_condenser_down.png",
		"condenser_condenser_left_8.png",
		"condenser_condenser_right_8.png",
		"condenser_condenser_front_8.png",
		"condenser_condenser_back_8.png"
	},
	groups = {crumbly = 3},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		on_condenser_rightclick(pos, node, player, itemstack, pointed_thing)
	end,
	on_punch = function(pos, node, player, pointed_thing)
		on_condenser_punch(pos, node, player, pointed_thing)
	end,
	on_construct = function(pos)
		on_condenser_construct(pos, 8)
	end
})

minetest.register_node("condenser:condenser_7", {
	description = "Condenser : 7 water",
	tiles = {
		"condenser_condenser_up.png",
		"condenser_condenser_down.png",
		"condenser_condenser_left_7.png",
		"condenser_condenser_right_7.png",
		"condenser_condenser_front_7.png",
		"condenser_condenser_back_7.png"
	},
	groups = {crumbly = 3},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		on_condenser_rightclick(pos, node, player, itemstack, pointed_thing)
	end,
	on_punch = function(pos, node, player, pointed_thing)
		on_condenser_punch(pos, node, player, pointed_thing)
	end,
	on_construct = function(pos)
		on_condenser_construct(pos, 7)
	end
})

minetest.register_node("condenser:condenser_6", {
	description = "Condenser : 6 water",
	tiles = {
		"condenser_condenser_up.png",
		"condenser_condenser_down.png",
		"condenser_condenser_left_6.png",
		"condenser_condenser_right_6.png",
		"condenser_condenser_front_6.png",
		"condenser_condenser_back_6.png"
	},
	groups = {crumbly = 3},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		on_condenser_rightclick(pos, node, player, itemstack, pointed_thing)
	end,
	on_punch = function(pos, node, player, pointed_thing)
		on_condenser_punch(pos, node, player, pointed_thing)
	end,
	on_construct = function(pos)
		on_condenser_construct(pos, 6)
	end
})

minetest.register_node("condenser:condenser_5", {
	description = "Condenser : 5 water",
	tiles = {
		"condenser_condenser_up.png",
		"condenser_condenser_down.png",
		"condenser_condenser_left_5.png",
		"condenser_condenser_right_5.png",
		"condenser_condenser_front_5.png",
		"condenser_condenser_back_5.png"
	},
	groups = {crumbly = 3},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		on_condenser_rightclick(pos, node, player, itemstack, pointed_thing)
	end,
	on_punch = function(pos, node, player, pointed_thing)
		on_condenser_punch(pos, node, player, pointed_thing)
	end,
	on_construct = function(pos)
		on_condenser_construct(pos, 5)
	end
})

minetest.register_node("condenser:condenser_4", {
	description = "Condenser : 4 water",
	tiles = {
		"condenser_condenser_up.png",
		"condenser_condenser_down.png",
		"condenser_condenser_left_4.png",
		"condenser_condenser_right_4.png",
		"condenser_condenser_front_4.png",
		"condenser_condenser_back_4.png"
	},
	groups = {crumbly = 3},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		on_condenser_rightclick(pos, node, player, itemstack, pointed_thing)
	end,
	on_punch = function(pos, node, player, pointed_thing)
		on_condenser_punch(pos, node, player, pointed_thing)
	end,
	on_construct = function(pos)
		on_condenser_construct(pos, 4)
	end
})

minetest.register_node("condenser:condenser_3", {
	description = "Condenser : 3 water",
	tiles = {
		"condenser_condenser_up.png",
		"condenser_condenser_down.png",
		"condenser_condenser_left_3.png",
		"condenser_condenser_right_3.png",
		"condenser_condenser_front_3.png",
		"condenser_condenser_back_3.png"
	},
	groups = {crumbly = 3},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		on_condenser_rightclick(pos, node, player, itemstack, pointed_thing)
	end,
	on_punch = function(pos, node, player, pointed_thing)
		on_condenser_punch(pos, node, player, pointed_thing)
	end,
	on_construct = function(pos)
		on_condenser_construct(pos, 3)
	end
})

minetest.register_node("condenser:condenser_2", {
	description = "Condenser : 2 water",
	tiles = {
		"condenser_condenser_up.png",
		"condenser_condenser_down.png",
		"condenser_condenser_left_2.png",
		"condenser_condenser_right_2.png",
		"condenser_condenser_front_2.png",
		"condenser_condenser_back_2.png"
	},
	groups = {crumbly = 3},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		on_condenser_rightclick(pos, node, player, itemstack, pointed_thing)
	end,
	on_punch = function(pos, node, player, pointed_thing)
		on_condenser_punch(pos, node, player, pointed_thing)
	end,
	on_construct = function(pos)
		on_condenser_construct(pos, 2)
	end
})

minetest.register_node("condenser:condenser_1", {
	description = "Condenser : 1 water",
	tiles = {
		"condenser_condenser_up.png",
		"condenser_condenser_down.png",
		"condenser_condenser_left_1.png",
		"condenser_condenser_right_1.png",
		"condenser_condenser_front_1.png",
		"condenser_condenser_back_1.png"
	},
	groups = {crumbly = 3},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		on_condenser_rightclick(pos, node, player, itemstack, pointed_thing)
	end,
	on_punch = function(pos, node, player, pointed_thing)
		on_condenser_punch(pos, node, player, pointed_thing)
	end,
	on_construct = function(pos)
		on_condenser_construct(pos, 1)
	end
})

minetest.register_node("condenser:condenser", {
	description = "Condenser : empty",
	tiles = {
		"condenser_condenser_up.png",
		"condenser_condenser_down.png",
		"condenser_condenser_left.png",
		"condenser_condenser_right.png",
		"condenser_condenser_front.png",
		"condenser_condenser_back.png"
	},
	groups = {crumbly = 3},
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		on_condenser_rightclick(pos, node, player, itemstack, pointed_thing)
	end,
	on_punch = function(pos, node, player, pointed_thing)
		on_condenser_punch(pos, node, player, pointed_thing)
	end,
	on_construct = function(pos)
		on_condenser_construct(pos, 0)
	end
})
