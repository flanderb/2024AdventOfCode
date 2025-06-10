require 'matrix'

class Day04b
    attr_accessor :file, :word_search_matrix, :number_of_xmas_found
    # Read in file
    # Parse file into two arrays
    # compare two arrays
    def initialize(file)
        @file = file
        @word_search_matrix = import_into_matrix(file)
        @number_of_xmas_found = count_number_of_xmas_found(@word_search_matrix)
    end

    def import_into_matrix(file)
        rows = []
        File.foreach(file) do |line|
            rows << line.chomp.split("")
        end
        return Matrix.rows(rows)  # Convert to matrix
    end

    def count_number_of_xmas_found(matrix)
        num_of_xmas = 0
        matrix.each_with_index do |e, row, col|
            if e == 'A' and xmas_at_index?(row, col, matrix)
                num_of_xmas += 1
            end
            
        end
        return num_of_xmas
    end

    def xmas_at_index?( start_x, start_y, matrix)
        # Check if the A is at least 1 away from each side
        word_1 = ''
        word_2 = ''
        if (start_x >= 1) and (start_x <= matrix.row_count-2) \
                and (start_y >= 1) and (start_y <= matrix.column_count-2)
            # Grab the two words
            word_1 = matrix[start_x - 1, start_y - 1] + matrix[start_x, start_y] + matrix[start_x + 1, start_y + 1]
            word_2 = matrix[start_x + 1, start_y - 1] + matrix[start_x, start_y] + matrix[start_x - 1, start_y + 1]
        end
        # p word_1
        # p word_2
        if is_mas?(word_1) and is_mas?(word_2)
            return true
        else
            return false
        end
    end

    def is_mas?(word)
        #is_word_mas = false
        if word == 'MAS' or word.reverse == 'MAS'
            return true
        else
            return false
        end
    end

end
