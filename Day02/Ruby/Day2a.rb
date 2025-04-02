

class Day2
    attr_accessor :file, :num_safe_reports
    # Read in input
    # Parse Input into two arrays
    # compare two arrays
    def initialize(file)
        @file = file
        @num_safe_reports = count_safe_reports(@file)
    end


    def count_safe_reports(input)
        safe_reports = 0
        File.foreach(input) do |report| 
            line = report.chomp
            report = line.split
            report = report.map(&:to_i)
            if report_safe?(report) or fixed_by_problem_dampner?(report) then
                safe_reports += 1
            end
        end
        return safe_reports
    end

    def report_safe?(report)
        # Any two adjacent levels differ by at least one and at most three.
        # The levels are either all increasing or all decreasing.
        return (report_sorted?(report) and report_span_managable?(report))

    end

    def report_sorted?(report)
        if report == report.sort or report == report.sort.reverse
            return true
        else
            return false
        end
    end

    def report_span_managable?(report)
        managable = true
        report.each_cons(2) do |current, next_val|
            case (current - next_val).abs
            when 1..3
                managable = (managable and true)
            else
                managable = (managable and false)
            end
        end
        return managable
    end

    def fixed_by_problem_dampner?(report)
        # take out elements one by one and test
        # once a removed element fixes the report
        # Return true
        report.each_index do |report_index|
            if report_safe?(report.reject.with_index{|v, i| i == report_index })
                return true
            end
        end
        return false
    end
    

end
