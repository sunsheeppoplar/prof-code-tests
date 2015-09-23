class Game

	def initialize
		@board = Board.new
	end

	def setup_game
		get_info
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


end


g = Game.new
g.setup_game