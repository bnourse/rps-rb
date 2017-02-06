require_relative "functions.rb"

def test_equality(expected, actual)
  if expected == actual
    puts "Pass"
  else
    puts "Fail. Expected #{expected}, but got #{actual}."
  end
end
require "pry"

def test_find_winner
	r = Round.new
	p1 = Player.new
	p1.init
	p2 = Player.new
	p2.init
	expected = [nil,p2,p1,p1,nil,p2,p2,p1,nil]
	actual = []
	weapons = ["rock","paper","scissors"]
	for weapon1 in weapons
		p1.set_weapon(weapon1)
		for weapon2 in weapons
			p2.set_weapon(weapon2)
			actual.push(r.test_find_winner(p1,p2))
		end
	end
	test_equality(expected,actual)
end

def test_current_winner
	rps = RPS.new
	rps.init
	p1 = rps.p1
	p2 = rps.p2
	expected = [p1,nil,p2,p2,p2]
	actual = []
	p1.set_score(3)
	p2.set_score(0)
	actual[0] = rps.current_winner
	p2.set_score(3)
	actual[1] = rps.current_winner
	p2.set_score(4)
	actual[2] = rps.current_winner
	p2.set_score(11)
	actual[3] = rps.current_winner
	p2.set_score(1000)
	actual[4] = rps.current_winner
	test_equality(expected, actual)
end

test_find_winner
test_current_winner