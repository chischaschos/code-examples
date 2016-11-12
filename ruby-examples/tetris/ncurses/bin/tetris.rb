require 'bundler'

Bundler.require

lib_path = File.realpath(File.dirname(__FILE__) + '/../lib')
$LOAD_PATH.unshift(lib_path)

require 'frame'
require 'loop'

def onsig(sig)
  Curses::close_screen
  exit sig
end

for i in %w[HUP INT QUIT TERM]
  if trap(i, "SIG_IGN") != 0 then  # 0 for SIG_IGN
    trap(i) {|sig| onsig(sig) }
  end
end


def add_borders(frame)
  (0..15).each do |h|
    frame.set(h, 0)
    frame.set(h, 40)
  end

end

def add_t(frame, col:, row:)
  frame.set(col - 1, row)
  frame.set(col, row)
  frame.set(col + 1, row)
  frame.set(col, row + 1)
end

def add_j(frame, col:, row:)
  frame.set(col - 1, row)
  frame.set(col, row)
  frame.set(col + 1, row)
  frame.set(col + 1, row + 1)
end

def add_l(frame, col:, row:)
  frame.set(col - 1, row)
  frame.set(col, row)
  frame.set(col + 1, row)
  frame.set(col - 1, row + 1)
end

def add_z(frame, col:, row:)
  frame.set(col - 1, row)
  frame.set(col, row)
  frame.set(col, row + 1)
  frame.set(col + 1, row + 1)
end

def add_s(frame, col:, row:)
  frame.set(col, row)
  frame.set(col + 1, row)
  frame.set(col - 1, row + 1)
  frame.set(col, row + 1)
end

def add_o(frame, col:, row:)
  frame.set(col, row)
  frame.set(col + 1, row)
  frame.set(col, row + 1)
  frame.set(col + 1, row + 1)
end

def add_i(frame, col:, row:)
  (0..4).each do |x|
    frame.set(x + col, row)
  end
end

def capture_keypress
  left = 0
  down = 0

  c = Curses.getch

  case c
  when Curses::KEY_LEFT
    left -= 1
  when Curses::KEY_RIGHT
    left += 1
  when Curses::KEY_DOWN
    down += 1
  end

  [left, down]
end

down = 0
left = 20

tloop = Loop.new
tloop.play do |f|
  pressed_left, pressed_down = capture_keypress
  down += pressed_down
  left += pressed_left

  add_borders(f)

  add_i(f, col: 3 + left, row: 0 + down)
  add_o(f, col: 3, row: 3)
  add_s(f, col: 3, row: 8)
  add_z(f, col: 3, row: 12)
  add_l(f, col: 3, row: 15)
  add_j(f, col: 3, row: 18)
  add_t(f, col: 3, row: 21)
end
