# Implementing https://www.hackerrank.com/challenges/s10-weighted-mean
#
# Usage:
# $ echo "5\n10 40 30 50 20\n1 2 3 4 5"|ruby weighted-mean.rb

ns = gets.strip.to_i
xs = gets.strip.split.map(&:to_f)
ws = gets.strip.split.map(&:to_f)
ws_sum = ws.reduce(&:+)

puts xs.zip(ws).reduce(0) {|r, n| r + n.first * n.last / ws_sum}.round(1)
