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
        matrix.each_with_index do |e, row, col|
            if e == 'X'
                num_of_words += number_of_words_at_index(word, row, col, matrix)
            end
            
        end
        return num_of_words
    end

    def number_of_words_at_index(word, start_x, start_y, matrix)
        sum = 0
        ["north", "northeast", "east", "southeast", "south", "southwest", "west", "northwest"].each do |d|
            sum += check_direction(word, start_x, start_y, matrix, d)
        end
        return sum
    end

    def get_deltas (index, start_x, start_y, direction)
        case direction
        when "north"
            delta_x = start_x - index
            delta_y = start_y 
        when "northeast"
            delta_x = start_x - index
            delta_y = start_y + index
        when "east"
            delta_x = start_x 
            delta_y = start_y + index
        when "southeast"
            delta_x = start_x + index
            delta_y = start_y + index
        when "south"
            delta_x = start_x + index
            delta_y = start_y 
        when "southwest"
            delta_x = start_x + index
            delta_y = start_y - index
        when "west"
            delta_x = start_x 
            delta_y = start_y - index
        when "northwest"
            delta_x = start_x - index
            delta_y = start_y - index
        end
        return delta_x, delta_y
    end

    def check_direction(word, start_x, start_y, matrix, direction)
        index = 0
       
        delta_x, delta_y = get_deltas(index, start_x, start_y, direction)
        
        while ((matrix[delta_x, delta_y] == word[index]) \
                and (delta_x >= 0) \
                and (delta_y >= 0) \
                and (delta_x <= matrix.row_count+1) \
                and (delta_y <= matrix.column_count+1) \
                and (index < word.length)) do
            
            index += 1
            delta_x, delta_y = get_deltas(index, start_x, start_y, direction)

        end

        if index == word.length            
            return 1
        else
            return 0
        end
    end

end
