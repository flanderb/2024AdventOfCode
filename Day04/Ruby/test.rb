require 'minitest/autorun'
require_relative 'Day04a'

class Day03Test < Minitest::Test

    def setup
        @word_search = Day04.new("../test_input.txt")
    end

    def test_file_is_there
        assert @word_search.file != nil
    end 

    def test_ws_matrix
        assert @word_search.word_search_matrix.instance_of?(Matrix)
    end

    def test_matrix_search_false
        assert @word_search.number_of_words_at_index('XMAS',@word_search.word_search_matrix, 0, 0) == 0
    end

    def test_matrix_search_true
        assert @word_search.number_of_words_at_index('XMAS',@word_search.word_search_matrix, 0, 4) == 1
    end
end