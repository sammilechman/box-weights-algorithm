require 'benchmark'
require_relative 'algorithm'
require_relative 'algorithm2'

def benchmark_algo(input)
  Benchmark.bm do |x|
    a = x.report { 100000.times { my_algorithm(input) } }
    b = x.report { 100000.times { my_algorithm2(input) } }
  end
end

benchmark_algo([3,2,5])
benchmark_algo([3, 2, 5, 5, 8])
benchmark_algo([8, 4, 2, 2, 2, 2, 2, 2])
benchmark_algo([9, 5, 3, 1])
benchmark_algo([9, 9, 9])
benchmark_algo([9, 10, 11, 12, 1, 2])
benchmark_algo([1, 4, 25, 87, 10])
