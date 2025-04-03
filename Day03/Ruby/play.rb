s = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"

a = s.scan(/(mul\(\d+,\d+\)|do\(\)|don't\(\))/)
# a = s.scan(/(mul\((\d+,\d+\))|(do\(\))|(don't\(\)))/)

p a.map { |inadverdant_array| inadverdant_array[0] }

b = [2,3,4,5]

c = a += b

p c