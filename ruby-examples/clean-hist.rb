# https://robots.thoughtbot.com/fight-back-utf-8-invalid-byte-sequences
# h = {}
# nh = []

# File.open('.zsh_history', 'r:UTF-8') do |file|
#   while line = file.gets do
#     clean_line = line.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
#     unless clean_line.match(/;(.+$)/)
#       p line
#       next
#     end

#     cmd = clean_line.match(/;(.+$)/)[1]

#     unless h[cmd]
#       h[cmd] = true
#       nh << clean_line
#     end
#   end
# end

# File.write('.zsh_history.new', nh.join)

class CleanHist
  def initialize(data)
    @data = data
  end

  def clean
    new_lines = []
    cmd_dict = {}

    lines.each do |line|

      clean_line = line.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
      cmd = clean_line.match(/;(.+$)/)[1]

      unless cmd_dict[cmd]
        cmd_dict[cmd] = true
        new_lines << clean_line
      end

    end

    new_lines.join("\n")
  end

  # lines
  #
  # Ignore first element matched since all lines start with this pattern
  # the first matched element is a single :
  def lines
    @data.split(/^:/m)[1..-1].map do |line|
      ":#{line}"
    end
  end
end
