MAX_WEIGHT = 16.0

def my_algorithm2(arr)
  raise_exception_if_invalid2(arr)
  boxes = generate_boxes2(arr)
  arr.sort.reverse.each do |a|
    boxes.sort_by! { |b| box_weight(b) }
    if box_weight(boxes[0]) + a > MAX_WEIGHT && box_weight(boxes[0]) != 0
      boxes << [a]
    else
      boxes[0] << a
    end
  end
  boxes
end

def box_weight(arr)
  arr.inject(:+) || 0
end

def raise_exception_if_invalid2(arr)
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

def generate_boxes2(array)
  oversized_packages = array.select { |line_item| line_item > MAX_WEIGHT }
  undersized_packages = array - oversized_packages
  num_return_arrays = (box_weight(undersized_packages) / MAX_WEIGHT).ceil
  num_return_arrays += oversized_packages.count
  Array.new(num_return_arrays) { [] }
end
