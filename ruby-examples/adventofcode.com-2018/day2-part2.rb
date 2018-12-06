list = ARGF.read.split("\n")

one_diffs = Hash.new { |h, k| h[k] = 0 }

list.each do |id|
  list.each do |other_id|
    diffs_count = 0
    skip = false
    found_diff = id.dup

    id.chars.each_with_index do |_, index|
      if id == other_id
        skip = true
        break
      end

      if other_id[index] != id[index]
        diffs_count += 1
        found_diff[index] = '_'
      end

      if diffs_count > 1
        skip = true
        break
      end
    end

    one_diffs[found_diff] += 1 unless skip
  end
end

puts one_diffs
