require 'pry'

class RPS
	def init
		@winner = ""
		@play_to_score = 3
		@p1 = Player.new
		@p1.init
		@p1.set_name("Player 1")
		@p2 = Player.new
		@p2.init
		@p2.set_name("Player 2")
		@round_number = 1;
	end

	def set_play_to_score(score)
		@play_to_score = score
	end

	def start_gameß
		while [@p1.score,@p2.score].max < @play_to_score	
			puts "Round #{@round_number}... FIGHT!"
			show_current_scores
			r = Round.new
			r.play_round(@p1,@p2)
			@round_number += 1
		end
		puts "Game over. The winner is: #{current_winner.name}!"
	end

	def play_web_round
		r = Round.new
		r.play_web_round(@p1,@p2)
		@round_winner = r.winner
		@round_number += 1
	end

	def current_winner
		winner = nil
		if @p1.score > @p2.score then winner = @p1
		elsif @p2.score > @p1.score then winner = @p2 end
		return winner
	end

	def show_current_scores
		puts "#{@p1.name} score: #{@p1.score} | #{@p2.name} score: #{@p2.score}"
	end

	def p1
		@p1
	end

	def p2
		@p2
	end

	def round_number
		@round_number
	end

	def play_to_score
		@play_to_score
	end

	def round_winner
		@round_winner
	end
end

class Round

	def play_round(player1, player2)
		@p1 = player1
		@p2 = player2
		pick_choices
		@winner = find_winner
		if @winner != nil
			@winner.won_round
			puts "#{winner.name} wins the round."
		else
			puts "Round is a tie."
		end
		return @winner
	end

	def play_web_round(player1, player2)
		@p1 = player1
		@p2 = player2
		@p1_choice = player1.choice.weapon
		@p2_choice = player2.choice.weapon
		find_winner
		if @winner != nil then @winner.won_round end
	end

	def pick_choices
		@p1_choice = @p1.pick_choice
		@p2_choice = @p2.pick_choice	
	end

	def find_winner
		@winner = nil
		case @p1_choice
		when "rock"
			if @p2_choice == "paper" then @winner = @p2
			elsif @p2_choice == "scissors" then @winner = @p1 end
		when "paper"
			if @p2_choice == "scissors" then @winner = @p2
			elsif @p2_choice == "rock" then @winner = @p1 end
		when "scissors"
			if @p2_choice == "rock" then @winner = @p2
			elsif @p2_choice == "paper" then @winner = @p1 end
		end
		return @winner
	end

	def winner
		@winner
	end

end

class Player
	def init
		@choice = Choice.new
		@player_name = ""
		@score = 0
	end

	def set_name(name)
		@player_name = name
	end

	def pick_choice
		@choice.pick_weapon(@player_name)
		return @choice.weapon
	end

	def won_round
		@score += 1
	end

	def score
		@score
	end

	def name
		@player_name
	end

	def set_weapon(input)
		@choice.set_weapon(input)
	end

	def choice
		@choice
	end

end

class Choice
	def valid(input)
		valid_choices = ["rock","paper","scissors"]
		return valid_choices.include? input
	end

	def set_weapon(input)
		@weapon = input.downcase
	end

	def pick_weapon(player_name)
		@weapon = ""
		while !valid(@weapon)
			print "#{player_name} please pick rock, paper, or scissors: "
			@weapon = gets.chomp.downcase
			if @weapon == "lizard" then puts "Hi Sumeet." end
			if !valid(@weapon) then puts "Invalid choice." end
		end
	end

	def weapon
		@weapon
	end
end


