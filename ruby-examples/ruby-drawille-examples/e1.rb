require 'drawille'

canvas = Drawille::Canvas.new

(0..1800).step(10).each do |x|
    canvas.set(x/10, 10 + Math.sin(x * Math::PI / 180) * 10)
end

puts canvas.frame
