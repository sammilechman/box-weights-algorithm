require 'active_support/core_ext'
require 'pry'

MAX_WEIGHT = 16.0

def number_of_boxes(array)
  arr = array.sort.reverse
  boxes = [[0]]
  missed_opportunity_space = 0

  until arr.empty?
    box = boxes.first
    box << arr.shift
    space_left = MAX_WEIGHT - box.sum

    total_secondary_adds = []

    until arr.empty? || arr.last > space_left
      total_secondary_adds << arr.pop
    end

    if total_secondary_adds.sum >= space_left
      box << space_left
      leftover_for_next_box = total_secondary_adds.sum - space_left
    else
      box += total_secondary_adds
      leftover_for_next_box = 0
    end

    missed_opportunity_space += (MAX_WEIGHT - box.sum)

    unless arr.empty? && leftover_for_next_box.zero?
      boxes.unshift([leftover_for_next_box])
    end
  end

  missed_opportunity_space = 0
  boxes.each do |box|
    missed_opportunity_space += MAX_WEIGHT - box.sum
  end

  ((missed_opportunity_space + array.sum) / MAX_WEIGHT).ceil
end

number_of_boxes([3,2,5])
