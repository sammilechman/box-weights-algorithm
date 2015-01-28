MAX_BOX_WEIGHT = 16.0

def my_algorithm(arr)
  raise_exception_if_invalid(arr)
  array = arr.sort
  oversized_packages = array.select{|line_item| line_item > MAX_BOX_WEIGHT}
  undersized_packages = array - oversized_packages

  num_return_arrays = (undersized_packages.inject(:+) / MAX_BOX_WEIGHT).ceil + oversized_packages.count

  sorted_arrays = Array.new(num_return_arrays)
  sorted_arrays.map!{|x| [[], 0]}
  # sorted_arrays is of the form: [ [[], 0], [[], 0], [[], 0], ... ]
  # zeroth element in [[], 0] represents an array we'll be returning
  # last element in [[], 0] is a running total of that zeroth element's weight

  until array.empty? do
    lowest_total = 1000
    sorted_arrays_index_to_add_at = nil
    element_to_pop = array.last
    need_another_box = true

    sorted_arrays.each_with_index do |x, i|
      break if array.empty?
      total_after_add = x[1] + element_to_pop
      if x[0].empty? || ((total_after_add < lowest_total) && (total_after_add <= MAX_BOX_WEIGHT))
        lowest_total = total_after_add
        sorted_arrays_index_to_add_at = i
        # found a suitable spot - won't be needing an additional box
        need_another_box = false
      end
    end

    if need_another_box
      # went through sorted_arrays without finding a spot - need another box
      to_add_to_sorted_arrays = [[], 0]
      sorted_arrays << to_add_to_sorted_arrays
    end

    if sorted_arrays_index_to_add_at
      # update the running total, then move element into sorted_arrays
      sorted_arrays[sorted_arrays_index_to_add_at][1] += element_to_pop
      sorted_arrays[sorted_arrays_index_to_add_at][0] << array.pop
    end
  end

  # don't need to keep running totals, return a 2-D array
  sorted_arrays.map(&:first)
end

def raise_exception_if_invalid(arr)
  raise "Input is not an array" unless arr.is_a?(Array)
  raise "Input array is empty" if arr.empty?
  arr.each do |el|
    if (el.is_a?(Float) || el.is_a?(Fixnum))
      raise "Invalid weight - less than 0" if !(el >= 0)
    else
      raise "Invalid weight - not a number"
    end
  end
end
