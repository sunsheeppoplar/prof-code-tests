class Game


	def initialize
		@board = Board.new
		@current_turn = 0
	end

	def setup_game
		get_info
		play_game
	end

	def play_game
		while @current_turn < 9 do
			puts "#{@board.layout}"
			next_turn
		end
		puts "#{@board.layout}"
		puts "Hey, looks like y'all are tied!"
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

	class Computer < Player
	end

	def get_info
		puts "Hi, welcome to a simple terminal Tic-Tac-Toe game. Plase choose whether you'd like to be 'x' or 'o,' please."
		@noughts_or_crosses = gets.chomp.downcase
		# prohibit non "x" or "o" marker ?
		@p1 = Player.new("#{@noughts_or_crosses}", "THANKSNILES", "hum")
		if @p1.marker == "x" ? @p2 = Player.new("o", "botbot", "comp") : @p2 = Player.new("x", "botbot", "comp")
		puts "Great, thanks for choosing #{@noughts_or_crosses}."
		end		
	end

	def make_move(player)
		if player.type == "hum" 
			puts "Choose an x and y coordinate, please." 
			move = gets.chomp.split(", ") 
			#what if user has improper input?
			x_coord = move[0].to_i 
			y_coord = move[1].to_i
			@board.layout[x_coord][y_coord] = player.marker 
		else
			puts "comp bro"
		end
	end

	def next_turn
		@current_turn += 1
		@current_turn.odd? ? make_move(@p1) : make_move(@p2) 	
	end


end


g = Game.new
g.setup_game