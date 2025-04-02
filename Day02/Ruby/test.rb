require 'minitest/autorun'
require_relative 'Day2a'

class Day2Test < Minitest::Test
    def test_init_links_to_file
        reports = Day2.new("../test_input.txt")
        assert reports.file != nil
    end

    def test_report_sorted?
        reports = Day2.new("../test_input.txt")
        report_sorted_asc = [1,2,7,8,9]
        report_sorted_desc = [8,6,6,5,4]
        report_unsorted = [4,5,6,8,7]

        assert reports.report_sorted?(report_sorted_asc) == true
        assert reports.report_sorted?(report_sorted_desc) == true
        assert reports.report_sorted?(report_unsorted) == false
    end

    def test_report_span_managable?
        reports = Day2.new("../test_input.txt")
        report_good_asc = [1,2,5,8,9]
        report_good_desc = [9,7,6,5,4]
        report_dup_desc = [8,6,6,5,4]
        report_dup_asc = [1,3,3,4,5]
        report_large_asc = [1,5,6,7,9]
        report_large_desc = [9,7,5,1,0]
        assert reports.report_span_managable?(report_good_asc) == true
        assert reports.report_span_managable?(report_good_desc) == true
        assert reports.report_span_managable?(report_dup_asc) == false
        assert reports.report_span_managable?(report_dup_desc) == false
        assert reports.report_span_managable?(report_large_asc) == false
        assert reports.report_span_managable?(report_large_desc) == false
    end

    def test_report_safe_isnt_safe
        reports = Day2.new("../test_input.txt")
        report1 = [1,2,5,8,9]
        report2 = [9,8,5,3,1]
        report3 = [1,2,1,3,5]
        report4 = [9,7,8,5,3]
        report5 = [9,8,7,3,1]
        report6 = [1,3,7,8,9]
        report7 = [9,7,8,5,5]
        assert reports.report_safe?(report1) == true
        assert reports.report_safe?(report2) == true
        assert reports.report_safe?(report3) == false
        assert reports.report_safe?(report4) == false
        assert reports.report_safe?(report5) == false
        assert reports.report_safe?(report6) == false
        assert reports.report_safe?(report7) == false
    end

    def test_fixed_by_problem_dampner()
        reports = Day2.new("../test_input.txt")
        report1 = [1,2,7,8,9] #can't fix
        report2 = [1,3,2,4,5] #can fix
        report3 = [1,2,2,4,5] #can fix
        
        assert fixed_by_problem_dampner?(report1) == true
        assert fixed_by_problem_dampner?(report2) == false
        assert fixed_by_problem_dampner?(report3) == false

    end


end