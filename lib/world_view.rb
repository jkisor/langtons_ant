require 'gosu'
require './lib/world'
class WorldView
	def initialize(window, world, cell_size)
		@window = window
		@world = world
		@cell_size = cell_size
	end
	def draw
		thickness = 2

		@world.size.times do |row| 
		    y = row * @cell_size
		    draw_horizontial_line(0, y, SIZE, y, thickness)
			@world.size.times do |col|
				x = col * @cell_size

				draw_vertical_line(x, 0, x, SIZE, thickness)
				if(@world.black_at?(col, row))
					fill_cell(x, y, @cell_size, Gosu::Color.argb(0xff000000))
				else
					fill_cell(x, y, @cell_size, Gosu::Color.argb(0xffffffff))
				end
			end
		end
	end

	private 

	def draw_horizontial_line(from_x, from_y, to_x, to_y, thickness=1)
		half_thickness = thickness/2
		line_color = Gosu::Color.argb(0xff8A8A8A)

		@window.draw_quad(from_x, from_y-half_thickness, line_color,
				      	  to_x , from_y- half_thickness, line_color,
				      	  to_x , to_y+ half_thickness, line_color,
					  	  from_x, to_y+ half_thickness, line_color,
					  	  1) #z	
	end

	def draw_vertical_line(from_x, from_y, to_x, to_y, thickness=1)
		half_thickness = thickness/2
		line_color = Gosu::Color.argb(0xff8A8A8A)

		@window.draw_quad(from_x-half_thickness, from_y, line_color,
				      	  to_x + half_thickness, from_y, line_color,
				      	  to_x + half_thickness, to_y, line_color,
					  	  from_x- half_thickness, to_y, line_color,
					  	  1) #z	
	end
	def fill_cell(x, y, size, color)
		@window.draw_quad(x, y, color,
						  x + size, y, color,
						  x + size, y+size, color,
						  x, y+size, color,
						  0) #z
	end
end