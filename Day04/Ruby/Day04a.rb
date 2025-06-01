require 'matrix'

class Day04
    attr_accessor :file, :word_search_matrix, :word, :number_of_words_found
    # Read in file
    # Parse file into two arrays
    # compare two arrays
    def initialize(word, file)
        @file = file
        @word = word
        @word_search_matrix = import_into_matrix(file)
        @number_of_words_found = count_number_of_words_found(@word, @word_search_matrix)
    end

    def import_into_matrix(file)
        rows = []
        File.foreach(file) do |line|
            rows << line.chomp.split("")
        end
        return Matrix.rows(rows)  # Convert to matrix
    end

    def count_number_of_words_found(word, matrix)
        num_of_words = 0
        matrix.each_with_index do |e, col, row|
            p "At [#{col},#{row}] = #{e}"
            if e == 'X'
                p "Found X"
                num_of_words += number_of_words_at_index(word, col, row, matrix)
            end
            
        end
        p "stop"
        return num_of_words
    end

    def number_of_words_at_index(word, start_x, start_y, matrix)
        sum = 0

        p "columns = #{matrix.column_count}; rows = #{matrix.row_count}"

        ["north", "northeast", "east", "southeast", "south", "southwest", "west", "northwest"].each do |d|
            p "Looking towards #{d}"
            sum += check_direction(word, start_x, start_y, matrix, d)
        end
        return sum
    end

    def get_deltas (index, start_x, start_y, direction)
        case direction
        when "north"
            delta_x = start_x 
            delta_y = start_y - index
        when "northeast"
            delta_x = start_x + index
            delta_y = start_y - index
        when "east"
            delta_x = start_x + index
            delta_y = start_y
        when "southeast"
            delta_x = start_x + index
            delta_y = start_y + index
        when "south"
            delta_x = start_x
            delta_y = start_y + index
        when "southwest"
            delta_x = start_x - index
            delta_y = start_y + index
        when "west"
            delta_x = start_x - index
            delta_y = start_y
        when "northwest"
            delta_x = start_x - index
            delta_y = start_y - index
        end
        return delta_x, delta_y
    end

    def check_direction(word, start_x, start_y, matrix, direction)
        index = 0
       
        delta_x, delta_y = get_deltas(index, start_x, start_y, direction)
        
        p "before: (#{delta_x}, #{delta_y}); i = #{index}, m = #{matrix[delta_x, delta_y]} word[index] = #{word[index]}"
        while ((matrix[delta_x, delta_y] == word[index]) \
                and (delta_x >= 0) \
                and (delta_y >= 0) \
                and (delta_x <= matrix.column_count+1) \
                and (delta_y <= matrix.row_count+1)) do
            # p "was (#{delta_x}, #{delta_y}); i = #{index}, m = #{matrix[delta_x, delta_y]}"
            index += 1
            delta_x, delta_y = get_deltas(index, start_x, start_y, direction)
            p "now (#{delta_x}, #{delta_y}); i = #{index}, m = #{matrix[delta_x, delta_y]}"
            p "now (#{matrix.column_count+1}, #{matrix.row_count+1});do these match?"
        end
        p "word[index] = #{word[index]}; m = #{matrix[delta_x, delta_y]}"
        p "is it the correct length #{index} - #{word.length}"
        if index == word.length
            p "word at (#{start_x}, #{start_y}) - #{word.length}"
            
            return 1
        else
            return 0
        end
    end

end
