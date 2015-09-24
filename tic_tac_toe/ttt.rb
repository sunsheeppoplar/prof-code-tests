class Game

	def initialize
		@board = Board.new
		@current_turn = 0
		@winner = nil
	end

	def setup_game
		get_info
		play_game
	end

	def play_game
		while @current_turn < 9 do
			puts "#{@board.layout}"
			next_turn
			end_game?
		end
		puts "#{@board.layout}"
		puts "Hey, looks like y'all are tied!"
	end


	def get_info
		puts "Hi, welcome to a simple terminal Tic-Tac-Toe game. Plase choose whether you'd like to be 'x' or 'o,' please."
		@noughts_or_crosses = gets.chomp.downcase

		puts "Please enter your name"
		@name = gets.chomp.downcase
		# prohibit non "x" or "o" marker ?
		@p1 = Player.new("#{@noughts_or_crosses}", "#{@name}", "hum")
		if @p1.marker == "x" ? @p2 = Player.new("o", "botbot", "comp") : @p2 = Player.new("x", "botbot", "comp")
			puts "Great, thanks for choosing #{@noughts_or_crosses}, #{@name}."
		end		
	end

	def make_move(player)
		prompt = "Choose an x and y coordinate, please."
		invalid_prompt = "Try again, invalid move!" 
		if player.type == "hum"

			puts prompt

			while move = gets.chomp.split(", ") do
				#what if user has improper input?
				x_coord = move[0].to_i 
				y_coord = move[1].to_i
				
				if x_coord.between?(0, 2) && y_coord.between?(0, 2) && @board.layout[x_coord][y_coord] == ""
					@board.layout[x_coord][y_coord] = player.marker
					break
				else 
					puts invalid_prompt
				end
			end
		else
			# simulates 'un-smart' computer move

			loop do
			x_coord = rand(0..2)
			y_coord = rand(0..2)

			break if @board.layout[x_coord][y_coord] == "" 
			end
			@board.layout[x_coord][y_coord] = player.marker

		end
			check_for_winner(player)
	end

	def next_turn
		@current_turn += 1
		@current_turn.odd? ? make_move(@p1) : make_move(@p2) 	
	end

	def check_for_winner(player)
		 if check_horiz(player) || check_vert(player)

		  # ||check_diag1 || check_diag2
			@winner = player.name
		end
	end

	def end_game?
		if @winner
			puts "Good job, #{@winner}; you're a real winner!"
			puts "Do you want to play again? Yes or no?"
			answer = gets.chomp.downcase
				if answer == "yes"
					g = Game.new
					g.setup_game
				else
					exit
				end
		end
	end

	def check_horiz(player)
		i = 0 
		while i < 3
			if @board.layout[i].uniq == [player.marker]
				return true
			end
		i += 1
		end
	end

	def check_vert(player)
		i = 0
		while i < 3
			b = (0..2).map { |j| @board.layout[j][i] }
			puts "#{b}"
			if b.uniq == [player.marker]
				return true
			end
		i += 1
		end
	end

	def check_diag1
	end

	def check_diag2
	end

end

class Board
	attr_accessor :layout
	def initialize
		@layout = Array.new(3) {Array.new(3) {""}}
	end
end

class Player
	attr_accessor :marker, :name, :type
	def initialize(marker, name, type)
		@marker = marker
		@name =  name
		@type = type
	end
end

g = Game.new
g.setup_game