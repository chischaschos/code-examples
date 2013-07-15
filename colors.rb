require "curses"
include Curses

init_screen
start_color

begin
  exit unless has_colors?
  setpos 1, 0
  addstr "Can change colors: #{can_change_color?}"
  setpos 2, 0
  addstr "Colors: #{colors}"
  setpos 3, 0
  addstr "Color pairs: #{color_pairs}"

  colors = [
    COLOR_CYAN,
    COLOR_BLACK,
    COLOR_BLUE,
    COLOR_GREEN,
    COLOR_MAGENTA,
    COLOR_RED,
    COLOR_WHITE,
    COLOR_YELLOW
  ]

  line = 0
  column = 5
  index = 1

  colors.each do |background|
    colors.each do |color|

      if line == 8
        line = 0
        column += 2
      end

      init_pair index, color + 1, background + 1
      attron color_pair index
      setpos 4 + (line += 1), column
      addstr "#{color + 1}#{background + 1}"
      attroff color_pair index
      index += 1
    end
  end

  #color_content(color)
  #color_pairs(attrs)
  #init_color(color, r, g, b)
  #use_default_colors()
  getch

ensure
  close_screen
end
