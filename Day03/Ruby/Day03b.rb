

class Day03
    attr_accessor :file, :total, :array
    # Read in input
    # Parse Input into two arrays
    # compare two arrays
    def initialize(input)
        @file = input
        @array = find_muls(input)
        p @array
        @total = eval_input(@array)
    end

    def find_muls(input)
        muls_array = Array.new
        File.foreach(input) do |line|
            muls_array += line.scan(/mul\(\d+,\d+\)|do\(\)|don't\(\)/)
        end
        return muls_array
    end

    def mul(n1, n2)
        return n1*n2
    end

    def eval_muls(mul_string)
        return eval mul_string
    end

    def eval_input(array_of_muls)
        total = 0
        do_it = true
        array_of_muls.each do |muls|

            if muls == "don't()" then
                do_it = false
            elsif muls == "do()" then
                do_it = true
            elsif do_it
                p muls
                total += eval_muls(muls)
            end
        end
        return total
    end
end