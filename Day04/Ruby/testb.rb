require 'minitest/autorun'
require_relative 'Day04b'

class Day04bTest < Minitest::Test

    def setup
        @word_search = Day04.new("../test_input.txt")
        # @word_search = Day04.new("XMAS","../test_input.txt")
    end

    def test_file_is_there
        assert @word_search.file != nil
    end 

    def test_ws_matrix
        assert @word_search.word_search_matrix.instance_of?(Matrix)
    end

    def test_is_mas?
        assert @word_search.is_mas?('MAS')
    end

    def test_true_xmas
        assert @word_search.xmas_at_index?(1,2, @word_search.word_search_matrix)
    end

    def test_false_xmas
        assert @word_search.xmas_at_index?(1,1, @word_search.word_search_matrix) == false
    end

    def test_count_xmas
        assert_equal(9, @word_search.number_of_xmas_found)
    end

end