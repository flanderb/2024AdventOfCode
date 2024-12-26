

class Day1
    attr_accessor :file, :list_1, :list_2, :total_distance
    # Read in input
    # Parse Input into two arrays
    # compare two arrays
    def initialize(file)
        @file = file
        @list_1, @list_2 = input_file(file)
        @total_distance = calc_total_distance(@list_1, @list_2)
    end

    def input_file(input)
        l1 = Array.new
        l2 = Array.new
        File.foreach(input) do |line| 
            line = line.chomp
            s1, s2 = line.split
            l1.push(s1)
            l2.push(s2)
        end
        return sort_list(l1), sort_list(l2)
    end

    def sort_list(list)
      return list.sort
    end

    def distance(n1, n2)
      return (n1 - n2).abs()
    end

    def calc_total_distance(l1, l2)
      td = 0
      if l1.size != l2.size then
        exit
      end

      for x in 0 .. l1.size-1 do
        d = distance(l1[x].to_i, l2[x].to_i)
        td += d
      end
      return td
    end
end
