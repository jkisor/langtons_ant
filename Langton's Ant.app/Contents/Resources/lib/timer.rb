class Timer
	attr_reader :time_left

	def initialize(duration)
		@duration = duration
		@time_left = duration
		@running = false
	end

	def start
		@running = true
	end	

	def update(delta_time)

		decrement_time_left(delta_time) if is_running?
		stop if is_expired?
	end

	def stop
		@running = false
	end

	def reset
		@time_left = @duration
	end

	def is_running?
		@running
	end

	def complete?
		is_expired? and is_running? == false
	end

	private 
	
	def decrement_time_left(delta_time)
		@time_left -= delta_time	
	end

	def is_expired?
		@time_left <= 0
	end
end