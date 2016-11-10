require 'curses'

class Loop

  def initialize
    Curses.noecho              # disable characters typed by the user
    Curses.timeout = 0         # non-blockig call
    Curses.stdscr.keypad(true) # enable keypad of user terminal
    Curses::crmode             # non buffered input
    Curses::curs_set(0)        # cursor invisible
  end

  def play
    loop do
      setup

      f = frame
      yield f
      paint(f)

      wait
      refresh
    end
  end

  private

  def paint(frame)
    Curses::addstr(frame.to_s)
    Curses::refresh
  end

  def frame
    cols = Curses::cols
    lines = Curses::lines
    Frame.new(cols, lines)
  end

  def wait
    sleep(0.5)
  end

  def setup
    # prepare default window
    Curses::init_screen   # create default window
    Curses::setpos(0, 0)
  end

  def refresh
    Curses::clear
    Curses::refresh
  end

end
