require_relative 'algorithm'

describe "box sorting algorithm" do
  context "handles specific examples correctly" do
    it "[3, 2, 5] returns [[5, 3, 2]]" do
      expect(my_algorithm([3, 2, 5])).to eq([[5, 3, 2]])
    end

    it "[3, 2, 5, 5, 8] returns [[8, 3], [5, 5, 2]]" do
      expect(my_algorithm([3, 2, 5, 5, 8])).to eq([[8, 3], [5, 5, 2]])
    end

    it "[8, 4, 2, 2, 2, 2, 2, 2] returns [[8, 2, 2], [4, 2, 2, 2, 2]]" do
      expect(my_algorithm([8, 4, 2, 2, 2, 2, 2, 2])).to eq([[8, 2, 2], [4, 2, 2, 2, 2]])
    end

    it "[9, 5, 3, 1] returns [[9], [5, 3, 1]]" do
      expect(my_algorithm([9, 5, 3, 1])).to eq([[9], [5, 3, 1]])
    end

    it "[9, 9, 9] returns [[9], [9], [9]]" do
      expect(my_algorithm([9, 9, 9])).to eq([[9], [9], [9]])
    end
  end

  context "throws errors correctly" do
    it "integer input throws an error" do
      expect{my_algorithm(3)}.to raise_error('Input is not an array')
    end

    it "float input throws an error" do
      expect{my_algorithm(19.0)}.to raise_error('Input is not an array')
    end

    it "hash input throws an error" do
      expect{my_algorithm({a: 3})}.to raise_error('Input is not an array')
    end

    it "negative weight in array throws an error" do
      expect{my_algorithm([9, -1, 3, 1])}.to raise_error('Invalid weight - less than 0')
    end

    it "too heavy weight throws an error" do
      expect{my_algorithm([9, 19, 3, 1])}.to raise_error('Invalid weight - more than 16')
    end

    it "non-numeric weight throws an error" do
      expect{my_algorithm([9, 'a', 3, 1])}.to raise_error('Invalid weight - not a number')
    end
  end
end
