a = [1,2,3,4,5]

a.each_index do |a_i|
    puts a.reject.with_index{|v, i| i == a_i }
    puts "-"
end

