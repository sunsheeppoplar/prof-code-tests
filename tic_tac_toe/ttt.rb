class Board
	attr_accessor :layout
	def initialize
		puts "Choose a board size, please. For example, '3.'"
		tiles = gets.chomp.to_i
		@layout = Array.new(tiles) {Array.new(tiles) {""}}
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
		while @current_turn < @board.layout.length*@board.layout.length do draw_board
			next_turn
			system "clear"
			end_game?
		end

		draw_board
		puts "Hey, looks like y'all are tied!"
	end

	def draw_board
		i = 0
		while i < @board.layout.length do

			puts "#{@board.layout[i]}"

			i += 1
		end
	end
	

	def get_info
		puts "Hi, welcome to a simple terminal Tic-Tac-Toe game. Please choose whether you'd like to be 'x' or 'o.'"
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
		prompt = "Choose an x and y coordinate, please. The format is 'x, y.' For example, '1, 0'"
		invalid_prompt = "Try again, invalid move!"
		if player.type == "hum"

			puts prompt

			while move = gets.chomp.split(",") do
				move.each {|coord| coord.gsub!(/\s+/, "")}

				x_coord = move[0].to_i
				y_coord = move[1].to_i
				if x_coord.between?(0, @board.layout.length) && y_coord.between?(0, @board.layout.length) && @board.layout[x_coord][y_coord] == ""
					@board.layout[x_coord][y_coord] = player.marker
					break
				else
					puts invalid_prompt
				end
			end
		else
			# simulates 'un-smart' computer move

			loop do
				x_coord = rand(0..@board.layout.length)
				y_coord = rand(0..@board.layout.length)

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
		if check_horiz(player) || check_vert(player)|| check_diag1(player) || check_diag2(player)
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
				puts "Thanks for playing!"
				exit
			end
		end
	end

	def check_horiz(player)
		i = 0 
		while i < @board.layout.length
			if @board.layout[i].uniq == [player.marker]
				return true
			end
			i += 1
		end
	end

	def check_vert(player)
		i = 0
		while i < @board.layout.length
			v = (0...@board.layout.length).map { |j| @board.layout[j][i] }
			if v.uniq == [player.marker]
				return true
			end
			i += 1
		end
	end

	def check_diag1(player)
		d1 = (0...@board.layout.length).map { |i| @board.layout[i][i] }
		if d1.uniq == [player.marker]
			return true
		end

	end

	def check_diag2(player)
		d1 = (0...@board.layout.length).map { |i| @board.layout[i][@board.layout.length-1-i] }
		if d1.uniq == [player.marker]
			return true
		end
	end
end

g = Game.new
g.setup_game