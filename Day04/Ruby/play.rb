
rows = []
File.foreach("../test_input.txt") do |line|
    p line.chomp.split("")
    rows << line.split("")
end

