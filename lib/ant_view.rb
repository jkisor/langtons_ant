require 'gosu'
class AntView
	def initialize(window, ant, size)
		@window = window
		@ant = ant
		@color = Gosu::Color.argb(0xffff0000)
		@size = size
	end

	def draw
		x = @ant.position[0] * @size   # cell size
		y = @ant.position[1] * @size # cell size

		@window.draw_quad(x, y, @color,
				      	  x+@size, y, @color,
				      	  x+@size, y+@size, @color,
					  	  x, y+@size, @color,
					  	  2) #z
	end
end