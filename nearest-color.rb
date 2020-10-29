#! /usr/bin/env ruby

color = `kdialog --getcolor`

#puts "selected color is #{color}"

/#(?<r>..)(?<g>..)(?<b>..)/ =~ color

#puts "r = #{r}, g = #{g}, b = #{b}"

file = File.open('svg.gpl')

line_counter = 0
least_distance = 999999
nearest_color = ''
nearest_color_rgb = ''

file.each() do |line|
  line_counter += 1
  next if line_counter < 4

  array_color = line.split

  distance = Math.sqrt( (r.to_i(16) - array_color[0].to_i) ** 2 +
                        (g.to_i(16) - array_color[1].to_i) ** 2 +
                        (b.to_i(16) - array_color[2].to_i) ** 2  )

  if distance < least_distance
    least_distance = distance
    nearest_color = array_color[3]
    nearest_color_rgb = array_color[4]
  end
end

print "#{nearest_color} #{nearest_color_rgb}"

`kdialog --msgbox "#{nearest_color}\n#{nearest_color_rgb}"`
