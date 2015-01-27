require_relative 'algorithm'

describe "box sorting algorithm" do
  context "correctly sorts weights" do
    it "when a simple example is used" do
      expect(my_algorithm([3, 2, 5])).to eq([[5, 3, 2]])
    end

    it "when two boxes must be used" do
      expect(my_algorithm([3, 2, 5, 5, 8])).to eq([[8, 3], [5, 5, 2]])
    end

    it "when many weights can fit into two boxes" do
      expect(my_algorithm([8, 4, 2, 2, 2, 2, 2, 2])).to eq([[8, 2, 2], [4, 2, 2, 2, 2]])
    end

    it "when boxes should end up with a different number of items" do
      expect(my_algorithm([9, 5, 3, 1])).to eq([[9], [5, 3, 1]])
    end

    it "when num_return_arrays is incorrect" do
      expect(my_algorithm([9, 9, 9])).to eq([[9], [9], [9]])
    end
  end

  context "throws error correctly" do
    it "when an integer is passed as an input" do
      expect{my_algorithm(3)}.to raise_error('Input is not an array')
    end

    it "when a float is passed as an input" do
      expect{my_algorithm(19.0)}.to raise_error('Input is not an array')
    end

    it "when a hash is passed as an input" do
      expect{my_algorithm({a: 3})}.to raise_error('Input is not an array')
    end

    it "when a negative weight is included" do
      expect{my_algorithm([9, -1, 3, 1])}.to raise_error('Invalid weight - less than 0')
    end

    it "when a too heavy weight is included" do
      expect{my_algorithm([9, 19, 3, 1])}.to raise_error('Invalid weight - more than 16')
    end

    it "when a non-numeric weight is included" do
      expect{my_algorithm([9, 'a', 3, 1])}.to raise_error('Invalid weight - not a number')
    end

    it "when input is empty array" do
      expect{my_algorithm([])}.to raise_error('Input array is empty')
    end
  end
end
