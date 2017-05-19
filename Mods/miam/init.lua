
-- Mod Name 		: miam
-- Mod Description 	: adds some food items
-- Mod Author		: DouGy

minetest.register_craftitem("miam:orange", {
	description = "Orange",
	inventory_image = "miam_orange.png",
	on_use = minetest.item_eat(5)
})

minetest.register_craftitem("miam:lemon", {
	description = "Lemon",
	inventory_image = "miam_lemon.png",
	on_use = minetest.item_eat(10)
})

minetest.register_craftitem("miam:cherry", {
	description = "Cherry",
	inventory_image = "miam_cherry.png",
	on_use = minetest.item_eat(15)
})
