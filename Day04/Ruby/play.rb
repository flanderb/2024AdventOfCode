require 'matrix'

m = Matrix[ ['S','.','S'], ['.','A','.'], ['M','.','M'] ]

word = m[0,0] + m[1,1] + m[2,2]

p word