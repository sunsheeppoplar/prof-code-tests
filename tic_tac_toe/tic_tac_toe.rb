class Game
	def play
		choose_marker
	end

	def choose_marker
		puts "Hi, welcome to a simple terminal Tic-Tac-Toe game. Plase choose whether you'd like to be 'x' or 'o,' please."
		noughtsOrCrosses = gets.chomp.downcase
		puts "Great, thanks for choosing #{noughtsOrCrosses}."
	end
		
end


g = Game.new
g.play