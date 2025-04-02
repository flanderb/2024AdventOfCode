s = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"

a = s.scan(/mul\(\d+,\d+\)/)

p a

b = [2,3,4,5]

c = a += b

p c