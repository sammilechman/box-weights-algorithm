require_relative 'number_of_boxes'

describe 'number_of_boxes function' do
  context 'deduces correct amount of boxes' do
    it "when a simple example is used" do
      expect(number_of_boxes([3, 2, 5])).to eq(1)
    end

    it "when two boxes must be used" do
      expect(number_of_boxes([3, 2, 5, 5, 8])).to eq(2)
    end

    it "when many weights can fit into two boxes" do
      expect(number_of_boxes([8, 4, 2, 2, 2, 2, 2, 2])).to eq(2)
    end

    it "when boxes are balanced with a different number of items" do
      expect(number_of_boxes([9, 5, 3, 1])).to eq(2)
    end

    it "when there is a tie, adds to box with less items" do
      expect(number_of_boxes([9, 5, 4, 1])).to eq(2)
    end

    it "when num_return_arrays is incorrect" do
      expect(number_of_boxes([9, 9, 9])).to eq(3)
    end

    it "when 4 boxes must be used, and weighted correctly" do
      expect(number_of_boxes([9, 10, 11, 12, 1, 2])).to eq(4)
    end

    it "when a too-heavy item is encountered" do
      expect(number_of_boxes([1, 4, 25, 10])).to eq(2)
    end

    it "when multiple too-heavy items are encountered" do
      expect(number_of_boxes([1, 4, 25, 87, 10])).to eq(3)
    end
  end
end
