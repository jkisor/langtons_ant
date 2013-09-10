class World
	attr_reader :size
	def initialize(size)
		@size = size
		white!
	end

	def black_at?(x, y)
		@cells[x][y] == "black"
	end

	def paint_white(x,y)
		@cells[x][y] = "white"
	end

	def paint_black(x,y)
		@cells[x][y] = "black"
	end

	def white!
		@cells = []
		@size.times do |x|
			@cells[x] = []
			@size.times do |y|
				@cells[x][y] = "white"
			end	
		end	
	end

	def black!
		@cells = []
		@size.times do |x|
			@cells[x] = []
			@size.times do |y|
				@cells[x][y] = "black"
			end	
		end	
	end

end