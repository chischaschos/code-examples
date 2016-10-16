# encoding: UTF-8
require "curses"
include Curses

def onsig(sig)
  close_screen
  exit sig
end

for i in 1 .. 15  # SIGHUP .. SIGTERM
  if trap(i, "SIG_IGN") != 0 then  # 0 for SIG_IGN
    trap(i) {|sig| onsig(sig) }
  end
end

def paint_grass
  attron color_pair 1
  cols.times do |col|
    setpos lines - 1, col
    addstr "‡"
  end
  attroff color_pair 1
end

def paint_car x
  setpos lines - 3, x
  addstr "©©==="
  setpos lines - 2, x
  addstr "©©©©"
end

def paint_bullet x
  setpos lines - 3, x + 5
  addstr "•"
end

def init_colors
  init_pair 1, COLOR_GREEN, COLOR_BLACK
end

init_screen
start_color

begin
  init_colors

  (cols - 200).times do |col|
    paint_grass
    paint_car col
    sleep 0.1
    refresh
    clear
  end

  (cols - 200 + 100).times do |col|
    paint_grass
    paint_car cols - 200
    paint_bullet cols - 200 + col
    sleep 0.05
    refresh
    clear
  end

  getch
ensure
  close_screen
end
