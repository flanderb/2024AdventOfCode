require 'minitest/autorun'
require_relative 'Day03b'

class Day03Test < Minitest::Test

    def setup
        @program = Day03.new("../test_input.txt")
    end

    def test_init_links_to_file 
        assert @program.file != nil
    end

    def test_return_array
        assert @program.array.kind_of?(Array) == true
    end

    def test_array_is_correct
        assert @program.array == ["mul(2,4)", "mul(5,5)", "mul(11,8)", "mul(8,5)"]
    end

    def test_mul
        assert @program.mul(2,4) == 8
    end

    def test_eval_muls
        assert @program.eval_muls("mul(11,8)") == 88
    end

    def test_total
        assert @program.total == 48
    end



    # def test_report_sorted?
    #     reports = Day03.new("../test_input.txt")
    #     report_sorted_asc = [1,2,7,8,9]
    #     report_sorted_desc = [8,6,6,5,4]
    #     report_unsorted = [4,5,6,8,7]

    #     assert reports.report_sorted?(report_sorted_asc) == true
    #     assert reports.report_sorted?(report_sorted_desc) == true
    #     assert reports.report_sorted?(report_unsorted) == false
    # end

end