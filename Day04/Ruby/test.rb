require 'minitest/autorun'
require_relative 'Day04a'

class Day03Test < Minitest::Test

    def setup
        @word_search = Day04.new("XMAS","../test_input.txt")
        # @word_search = Day04.new("XMAS","../test_input.txt")
    end

    def test_file_is_there
        assert @word_search.file != nil
    end 

    def test_ws_matrix
        assert @word_search.word_search_matrix.instance_of?(Matrix)
    end

    def test_matrix_search_false
        assert @word_search.number_of_words_at_index('XMAS', 0, 0, @word_search.word_search_matrix) == 0
    end

    def test_matrix_search_true
        assert @word_search.number_of_words_at_index('XMAS', 0, 4, @word_search.word_search_matrix) == 1
    end

    def test_count_all_words
        # assert @word_search.number_of_words_found == 18
        assert_equal(18, @word_search.number_of_words_found)
    end
end