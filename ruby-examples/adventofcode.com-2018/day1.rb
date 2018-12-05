ft = 0
fs = Hash.new { |h, k| h[k] = 0 }
fs[0] = 1

list = ARGF.read.split("\n")

list.cycle do |f|
  ft += f.to_i
  fs[ft] += 1

  if fs[ft] == 2
    puts ft
    break
  end
end
