require 'matrix'
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

["north", "northeast", "east", "southeast", "south", "southwest", "west", "northwest"].each do |d| 
    delta_x, delta_y = get_deltas(1, 4, 4, d)
    p "#{d} = #{delta_x}, #{delta_y}"
end

Matrix[ [1,2], [3,4] ].each_with_index do |e, row, col|
  puts "#{e} at #{row}, #{col}"
end