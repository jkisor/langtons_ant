require 'gosu'
require './lib/ant'
require './lib/ant_view'
require './lib/world_view'
require './lib/timer'

SIZE = 800
class GameWindow < Gosu::Window
	def initialize
	    super(SIZE, SIZE, false)
	    self.caption = "Langton's ant"

	    @last_frame = Gosu::milliseconds

	    cell_size = 10

		@world = World.new(SIZE/cell_size)	
	    @world_view = WorldView.new(self, @world, cell_size)

	    @ant = Ant.new(@world)
	    @ant_view = AntView.new(self, @ant, cell_size)

	    @timer = Timer.new(0.01)

	    @information = Gosu::Font.new(self, "arial", 24)
 	end

	def calc_delta_time
    	@this_frame = Gosu::milliseconds
    	@delta_time = (@this_frame - @last_frame) / 1000.0
    	@last_frame = @this_frame
 	end

 	def update
 		calc_delta_time

 		@timer.update(@delta_time)
 		if(@timer.complete?)
 			@ant.move
 			@timer.reset
 			@timer.start
 		end
 	end
	
	def draw
		draw_background
		@world_view.draw
		@ant_view.draw

		@information.draw("Controls: 'SPACE' = start/stop, 'B' = Reset/All black, 'W' = Reset/All white", 0, 0, 3, 1, 1, 0xffff0000)
				
	end

	def draw_background
		draw_quad(0, 0, Gosu::Color.argb(0xff00ff33), SIZE, 0, Gosu::Color.argb(0xff00ff33), 
			SIZE, SIZE, Gosu::Color.argb(0xff00ffdd), 0, SIZE, Gosu::Color.argb(0xff00ffdd))
	end
	
	def button_down(id)
		case id
			when Gosu::KbEscape
			   close
			when Gosu::KbB
				@world.black!
				@ant.center_in_world
				@timer.stop
			when Gosu::KbW
				@world.white!
				@ant.center_in_world
				@timer.stop
			when Gosu::KbSpace
				if @timer.is_running?
					@timer.stop 
				else
					@timer.start
				end
		end
	end
end

game_window = GameWindow.new
game_window.show