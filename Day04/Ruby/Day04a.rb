require 'matrix'

class Day04
    attr_accessor :file, :word_search_matrix
    # Read in input
    # Parse Input into two arrays
    # compare two arrays
    def initialize(input)
        @file = input
        @word_search_matrix = import_into_matrix(input)
    end

    def import_into_matrix(file)
        rows = []
        File.foreach(file) do |line|
            rows << line.chomp.split("")
        end
        return Matrix.rows(rows)  # Convert to matrix
    end

    def number_of_words_at_index(word,matrix, start_x, start_y)
        if matrix[x,y] == word[0]
            word_count = 0

            return 1
        else
            return 0
        end
    end

    def check_for_word_in_direction(word, matrix, start_x, start_y, direction)
        relative_x = 0
        relative_y = 0
        index = 0


        if matrix[start_x - relative_x,start_x - relative_y] == word[0]
            if direction == "north"

    end

    def check_north(word, start_x, start_y, matrix)



end
