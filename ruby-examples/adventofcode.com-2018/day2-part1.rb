list = ARGF.read.split("\n")

twos = 0
threes = 0

list.each do |id|
  counts = Hash.new { |h, k| h[k] = 0 }
  id.chars.each do |c|
    counts[c] += 1
  end

  twos += 1 if counts.find { |_, v| v == 2 }
  threes += 1 if counts.find { |_, v| v == 3 }
end

puts twos, threes, twos * threes
