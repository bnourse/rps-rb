require 'sinatra'
require_relative './functions.rb'

game = RPS.new
game.init

get("/") do
	erb :index
end

post("/new_game") do
	game.init
	redirect "/"
end

post("/setup_game") do
	game.p1.set_name(params["p1name"])
	game.p2.set_name(params["p2name"])
	redirect "/play_game"
end

post("/play_round") do
	game.p1.set_weapon(params["p1choice"])
	game.p2.set_weapon(params["p2choice"])
	game.play_web_round
	if [game.p1.score, game.p2.score].max < game.play_to_score
		redirect "/play_game"
	else
		redirect "/game_over"
	end
end

get("/play_game") do
	@game = game
	erb :play_game
end

get("/game_over") do
	@game = game
	erb :game_over
end