def my_algorithm(arr)
  array = arr.sort
  num_return_arrays = (array.inject(:+) / 16.0).ceil

  sorted_arrays = Array.new(num_return_arrays)
  sorted_arrays.map!{|x| [[], 0]}
  # sorted_arrays is of the form: [ [[], 0], [[], 0], [[], 0], ... ]
  # zeroth element in [[], 0] represents an array we'll be returning.
  # last element in [[], 0] is a running total of that zeroth element's weight.

  array.length.times do
    break if array.empty?
    lowest_total = 1000
    sorted_arrays_index_to_add_at = nil
    element_to_pop = array.last

    2.times do |loop|
      if loop == 0
        # first loop determines the package to add to.
        sorted_arrays.each_with_index do |x, i|
          break if array.empty?
          total_after_add = x[1] + element_to_pop
          if (total_after_add < lowest_total) && ((x[1] + element_to_pop) <= 16)
            lowest_total = total_after_add
            sorted_arrays_index_to_add_at = i
          end
        end
      else
        # second loop actually adds the element to sorted_arrays.
        # first update the running total
        sorted_arrays[sorted_arrays_index_to_add_at][1] += element_to_pop
        # then push number into the current array.
        sorted_arrays[sorted_arrays_index_to_add_at][0] << array.pop
      end
    end
  end

  # change to .present? for rails
  if array.any?
    # leftovers! an edge case. leftover weight is necessarily < 16.
    to_add_to_sorted_arrays = [[], 0]
    until array.empty?
      to_add_to_sorted_arrays[0] << array.pop
    end
    sorted_arrays << to_add_to_sorted_arrays
  end

  # don't need to keep running totals, return a 2-D array.
  sorted_arrays.map(&:first)
end
