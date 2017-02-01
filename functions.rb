

class RPS
	def init
		@p1_wins = 0
		@p2_wins = 0
		@ties = 0
	end

	def start_game

	end
end

class Round
	def init
		@p1_choice = ""
		@p2_choice = ""
	end

	def play_round


	end

	def get_choice

	end

	def get_valid_choice

	end
end

class Player
	def init
		@choice = Choice.new
		@score = 0
		@name = ""
	end

	def choice
		@choice
	end

	def set_name(name)
		@name = name
	end

	def get_choice
		@choice.pick_weapon
		return @choice
	end
end

class Choice

	def valid(input)
		input = input.downcase 
		valid_choices = ["rock","paper","scissors"]
		return valid_choices.include? input
	end

	def pick_weapon
		@weapon = ""
		while !valid(@weapon)
			print "please pick rock, paper, or scissors: "
			@weapon = gets.chomp
			if !valid(@weapon) then puts "Invalid choice." end
		end
	end

	def weapon
		@weapon
	end
end

