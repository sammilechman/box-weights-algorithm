require 'benchmark'
require_relative 'algorithm'
require_relative 'algorithm2'

Benchmark.bm do |x|
  x.report { 100000.times { my_algorithm([3, 2, 5]) } }
  x.report { 100000.times { my_algorithm2([3, 2, 5]) } }

  x.report { 100000.times { my_algorithm([1, 4, 25, 87, 10]) } }
  x.report { 100000.times { my_algorithm2([1, 4, 25, 87, 10]) } }
end
