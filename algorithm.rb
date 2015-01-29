require 'active_support/core_ext'

MAX_WEIGHT = 16.0

def my_algorithm(arr)
  raise_exception_if_invalid(arr)
  boxes = generate_boxes(arr)
  arr.sort.reverse.each do |a|
    boxes.sort_by! { |b| [b.sum, b.length] }
    if boxes[0].sum + a > MAX_WEIGHT && boxes[0].sum != 0
      boxes << [a]
    else
      boxes[0] << a
    end
  end
  boxes
end

def raise_exception_if_invalid(arr)
  fail 'Input is not an array' unless arr.is_a?(Array)
  fail 'Input array is empty' if arr.empty?
  arr.each do |el|
    if el.is_a?(Float) || el.is_a?(Fixnum)
      fail 'Invalid weight - less than 0' unless el >= 0
    else
      fail 'Invalid weight - not a number'
    end
  end
end

def generate_boxes(array)
  oversized_packages = array.select { |line_item| line_item > MAX_WEIGHT }
  undersized_packages = array - oversized_packages
  num_return_arrays = (undersized_packages.sum / MAX_WEIGHT).ceil
  num_return_arrays += oversized_packages.count
  Array.new(num_return_arrays) { [] }
end
