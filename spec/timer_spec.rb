require "./lib/timer"
describe Timer do
	before(:each)do
		@timer = Timer.new(10)
	end

	describe ".new" do
		it "should not be running" do
			timer = Timer.new(10)

			expect(timer.is_running?).to be_false
		end
	end
	context "when running" do
		it "should decrement time left by delta time" do
			@timer.start
			@timer.update(1)

			expect(@timer.time_left).to eq 9 
			expect(@timer.is_running?).to be_true
		end
		context "when duration expires" do
			it "should no longer be running" do
				@timer.start
				@timer.update(10)
				expect(@timer.time_left).to eq 0
				expect(@timer.is_running?).to be_false
			end

			it "should be complete" do
				@timer.start
				@timer.update(10)
				expect(@timer.complete?).to be_true
			end
		end
		
		it "can be stopped" do
			@timer.start
			@timer.stop
			expect(@timer.is_running?).to be_false
		end
	end

	context "when stopped" do
		describe ".update" do
			it "shouldn't modify time left" do
				@timer.update(1)
				expect(@timer.time_left).to eq 10
			end
		end
	end

	it "can be reset" do
		@timer.update(1)
		@timer.reset
		expect(@timer.time_left).to eq 10
	end
end