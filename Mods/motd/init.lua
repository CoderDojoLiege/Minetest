
-- Mod Name 		: motd
-- Mod Description 	: simple message of the day that pops up on player connection
-- Mod Author		: DouGy

minetest.register_on_joinplayer(function(player)
	local message = "motd : Hello "..player:get_player_name().."!"
	minetest.chat_send_player(player:get_player_name(), message)
end)
