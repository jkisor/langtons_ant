class Ant
	attr_accessor :direction

	def initialize(world)
		@world = world
		center_in_world
		@direction = [1,0]
	end

	def center_in_world
		@x = @y = @world.size / 2
	end

	def position
		return @x, @y
	end

	def position=(pos)
		@x = pos[0]
		@y = pos[1]
	end

	def move 
		if @world.black_at?(@x, @y)
			@world.paint_white(@x, @y)
			turn_right
		else
			@world.paint_black(@x, @y)
			turn_left
		end 

		update_position
		enforce_wrapping_bounds
	end

	def turn_right
		dir = [@direction[0], @direction[1]]
		@direction[0] = -1 * dir[1]
		@direction[1] = dir[0]
	end

	def turn_left
		dir = [@direction[0], @direction[1]]
		@direction[0] = dir[1]
		@direction[1] = -1 * dir[0]
	end

	private 
	
	def update_position
		@x += @direction[0]
		@y += @direction[1]
	end
	
	def enforce_wrapping_bounds
		@x %= @world.size
		@y %= @world.size
	end
end