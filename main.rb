require_relative "functions.rb"

# c = Choice.new
# c.pick_weapon
# puts c.weapon

# p1 = Player.new
# p1.init
# p1.set_name("Player 1")
# choice = p1.pick_choice
# puts choice.inspect

game = RPS.new
game.init
game.start_game
