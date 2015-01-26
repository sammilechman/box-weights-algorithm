require 'pry'
require_relative 'algorithm'

def test_algorithm(input, expected)
  puts "\nmy_algorithm(#{input}) should equal #{expected}."
  if (my_algorithm(input) == expected)
    puts "PASS"
  else
    puts "FAIL"
    puts "Yields: #{my_algorithm(input)}"
  end
end

def run_tests
  puts "\n-- SORTING ALGORITHM --\n"
  test_algorithm([3, 2, 5], [[5, 3, 2]])
  test_algorithm([3, 2, 5, 5, 8], [[8, 3], [5, 5, 2]])
  test_algorithm([8, 4, 2, 2, 2, 2, 2, 2],  [[8, 2, 2], [4, 2, 2, 2, 2]])
  test_algorithm([9, 5, 3, 1], [[9], [5, 3, 1]])
  puts "\n+++++++++++++++++++++++"
end

run_tests
