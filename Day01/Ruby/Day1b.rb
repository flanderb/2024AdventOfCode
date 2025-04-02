

class Day1
    attr_accessor :file, :list_1, :list_2, :similarity_score
    # Read in input
    # Parse Input into two arrays
    # compare two arrays
    def initialize(file)
        @file = file
        @list_1, @list_2 = input_file(file)
        @similarity_score = calc_similarity(@list_1, @list_2)
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

    # def number_of_times_in_list(number, list)
    #   return list.count(number)
    # end



    def calc_similarity(list_1, list_2)
      temp_sim = 0
      list_1.each do |element|
        temp_sim += element.to_i * list_2.count(element)
      end
      return temp_sim
    end

end
