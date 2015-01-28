require_relative 'algorithm2'

describe "box sorting algorithm" do
  context "correctly sorts weights" do
    it "when a simple example is used" do
      expect(my_algorithm2([3, 2, 5])).to include([5, 3, 2])
    end

    it "when two boxes must be used" do
      expect(my_algorithm2([3, 2, 5, 5, 8])).to include([5, 5, 2], [8, 3])
    end

    it "when many weights can fit into two boxes" do
      expect(my_algorithm2([8, 4, 2, 2, 2, 2, 2, 2])).to include([4, 2, 2, 2, 2], [8, 2, 2])
    end

    it "when boxes are balanced with a different number of items" do
      expect(my_algorithm2([9, 5, 3, 1])).to include([5, 3, 1], [9])
    end

    it "when there is a tie, adds to box with less items" do
      expect(my_algorithm2([9, 5, 4, 1])).to include([5, 4], [9, 1])
    end

    it "when num_return_arrays is incorrect" do
      expect(my_algorithm2([9, 9, 9])).to include([9], [9], [9])
    end

    it "when 4 boxes must be used, and weighted correctly" do
      expect(my_algorithm2([9, 10, 11, 12, 1, 2])).to include([10,1], [11], [12], [9, 2])
    end

    it "when a too-heavy item is encountered" do
      expect(my_algorithm2([1, 4, 25, 10])).to include([10, 4, 1], [25])
    end

    it "when multiple too-heavy items are encountered" do
      expect(my_algorithm2([1, 4, 25, 87, 10])).to include([10, 4, 1], [25], [87])
    end
  end

  context "throws error correctly" do
    it "when an integer is passed as an input" do
      expect{my_algorithm2(3)}.to raise_error('Input is not an array')
    end

    it "when a float is passed as an input" do
      expect{my_algorithm2(19.0)}.to raise_error('Input is not an array')
    end

    it "when a hash is passed as an input" do
      expect{my_algorithm2({a: 3})}.to raise_error('Input is not an array')
    end

    it "when a negative weight is included" do
      expect{my_algorithm2([9, -1, 3, 1])}.to raise_error('Invalid weight - less than 0')
    end

    it "when a non-numeric weight is included" do
      expect{my_algorithm2([9, 'a', 3, 1])}.to raise_error('Invalid weight - not a number')
    end

    it "when input is empty array" do
      expect{my_algorithm2([])}.to raise_error('Input array is empty')
    end
  end
end
