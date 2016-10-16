require 'drawille'
require 'curses'

Curses::init_screen()

flipbook = Drawille::FlipBook.new

change = 5

flipbook.play do
  canvas = Drawille::Canvas.new

#   change += 2
  # r = change ** 2
  r = change
  a = 1
  b = 1
  (0..1).each do |x|
    y1 = b + Math.sqrt(r - (x - a) ** 2)
    y2 = b - Math.sqrt(r - (x - a) ** 2)
    canvas.set(x, y1)
    canvas.set(x, y2)
  end
  canvas
end
