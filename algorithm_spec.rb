require_relative 'algorithm'

describe "box sorting algorithm" do
  it "input [3, 2, 5] returns [[5, 3, 2]]" do
    expect(my_algorithm([3, 2, 5])).to eq([[5, 3, 2]])
  end

  it "input [3, 2, 5, 5, 8] returns [[8, 3], [5, 5, 2]]" do
    expect(my_algorithm([3, 2, 5, 5, 8])).to eq([[8, 3], [5, 5, 2]])
  end

  it "input [8, 4, 2, 2, 2, 2, 2, 2] returns [[8, 2, 2], [4, 2, 2, 2, 2]]" do
    expect(my_algorithm([8, 4, 2, 2, 2, 2, 2, 2])).to eq([[8, 2, 2], [4, 2, 2, 2, 2]])
  end

  it "input [9, 5, 3, 1] returns [[9], [5, 3, 1]]" do
    expect(my_algorithm([9, 5, 3, 1])).to eq([[9], [5, 3, 1]])
  end
end
