class Game

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

	def get_info
	end
end


b = Board.new
