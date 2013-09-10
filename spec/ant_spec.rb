require "ant"
require "world"

describe Ant do
	before(:each) do
		@world = World.new(10)
		@ant = Ant.new(@world)
	end
	it "starts at worlds center" do
		expect(@ant.position).to eq [5, 5]
	end
	context "in an all white world" do
		it "moves once" do
			@ant.move
			expect(@ant.position).to eq [5, 4]
			expect(@world.black_at?(5, 5)).to be_true
		end

		it "moves twice" do
			2.times { @ant.move }
			expect(@ant.position).to eq [4, 4]
			expect(@world.black_at?(5, 5)).to be_true
			expect(@world.black_at?(5, 4)).to be_true

		end

		it "moves thrice" do
			3.times { @ant.move }
			expect(@ant.position).to eq [4, 5]

			expect(@world.black_at?(5, 5)).to be_true
			expect(@world.black_at?(5, 4)).to be_true
			expect(@world.black_at?(4, 4)).to be_true
		end

		it "moves four times" do
			4.times { @ant.move }
			expect(@ant.position).to eq [5, 5]

			expect(@world.black_at?(5, 5)).to be_true
			expect(@world.black_at?(5, 4)).to be_true
			expect(@world.black_at?(4, 4)).to be_true
			expect(@world.black_at?(4, 5)).to be_true

		end
	end

	context "in an all black world" do
		it "moves 4 times" do
			@world.black!
			4.times{ @ant.move }
			expect(@world.black_at?(5, 5)).to be_false
			expect(@world.black_at?(5, 6)).to be_false	
			expect(@world.black_at?(4, 6)).to be_false	
			expect(@world.black_at?(4, 5)).to be_false	

			expect(@ant.position).to eq [5, 5]
		end

	end

	context "when moving out of world bounds" do
		it "should wrap vertically" do
			@world.white!
			@ant.position = [5, 0]
			@ant.move

			expect(@ant.position).to eq [5, 9]
		end

		it "should wrap horizontally" do
			@world.white!
			@ant.direction = [0,-1]
			@ant.position = [0, 5]
			@ant.move 

			expect(@ant.position).to eq [9, 5]

		end
	end
end


