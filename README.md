Algorithm: Sorting weighted packages into boxes
===

I have an unordered array containing product weights, e.g. [3, 2, 5, 5, 8] which need to be divided up into smaller arrays.

Rules:

**REQUIRED**: Should return 1 or more arrays.

**REQUIRED**: No array should sum to more than 16.

**REQUIRED**: Return minimum possible number of arrays, the example above can fit into two arrays.

**IDEALLY**: Arrays should be weighted as evenly as possible.

In the example above, the ideal return would be [ [8, 3], [5, 5, 2] ]

*Written in Ruby 2.0.0.*
