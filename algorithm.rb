def my_algorithm(arr)
  raise_exception_if_invalid(arr)
  array = arr.sort
  num_return_arrays = (array.inject(:+) / 16.0).ceil

  sorted_arrays = Array.new(num_return_arrays)
  sorted_arrays.map!{|x| [[], 0]}
  # sorted_arrays is of the form: [ [[], 0], [[], 0], [[], 0], ... ]
  # zeroth element in [[], 0] represents an array we'll be returning
  # last element in [[], 0] is a running total of that zeroth element's weight

  until array.empty? do
    lowest_total = 1000
    sorted_arrays_index_to_add_at = nil
    element_to_pop = array.last

    2.times do |loop|
      if loop == 0
        # this loop determines the package to add to
        need_another_box = true
        sorted_arrays.each_with_index do |x, i|
          break if array.empty?
          total_after_add = x[1] + element_to_pop
          if (total_after_add < lowest_total) && ((x[1] + element_to_pop) <= 16)
            lowest_total = total_after_add
            sorted_arrays_index_to_add_at = i
            # found a suitable spot - won't be needing an additional box
            need_another_box = false
          end
        end
        if need_another_box
          # went through sorted_arrays without finding a spot.
          # need to add another box.
          to_add_to_sorted_arrays = [[], 0]
          sorted_arrays << to_add_to_sorted_arrays
        end
      else
        # this loop actually adds the element to sorted_arrays
        if sorted_arrays_index_to_add_at
          # first update the running total
          sorted_arrays[sorted_arrays_index_to_add_at][1] += element_to_pop
          # then push number into the current array
          sorted_arrays[sorted_arrays_index_to_add_at][0] << array.pop
        end
      end
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
      if !(el >= 0)
        raise "Invalid weight - less than 0"
      elsif !(el <= 16)
        raise "Invalid weight - more than 16"
      end
    else
      raise "Invalid weight - not a number"
    end
  end
end
