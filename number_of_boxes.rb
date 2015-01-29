# http://aaaipress.org/Papers/AAAI/2002/AAAI02-110.pdf

require 'active_support/core_ext'
# require 'pry'

MAX_WEIGHT = 16.0

def number_of_boxes(array)
  arr = array.sort.reverse
  boxes = [[0]]

  until arr.empty?
    space_left = calc_space_left(boxes[0])

    if arr.first <= space_left
      boxes[0] << arr.shift
    elsif boxes[0].sum.zero? && arr.first > space_left
      boxes[0] << space_left
      arr.shift
    else
      boxes.unshift([arr.shift])
    end

    space_left = calc_space_left(boxes[0])

    total_secondary_adds = []

    until arr.empty? || arr.last > space_left
      total_secondary_adds << arr.pop
    end

    if total_secondary_adds.sum >= space_left
      boxes[0] << space_left
      leftover_for_next_box = total_secondary_adds.sum - space_left
    else
      boxes[0] += total_secondary_adds
      leftover_for_next_box = 0
    end

    unless arr.empty? && leftover_for_next_box.zero?
      arr << leftover_for_next_box unless leftover_for_next_box.zero?
      arr.sort!.reverse!
    end
  end

  missed_opportunity_space = 0

  boxes.each do |box|
    missed_opportunity_space += calc_space_left(box)
  end

  array.map! { |box| box > 16 ? 16 : box }
  ((missed_opportunity_space + array.sum) / MAX_WEIGHT).ceil
end

def calc_space_left(box)
  space_left = MAX_WEIGHT - box.sum
  space_left >= 0 ? space_left : 0
end

# p number_of_boxes([1, 4, 25, 10])
