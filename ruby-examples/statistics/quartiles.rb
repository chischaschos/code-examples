# Implementation of https://www.hackerrank.com/challenges/s10-quartiles
#
# Enter your code here. Read input from STDIN. Print output to STDOUT
#
# Usage:
# echo "10\n3 7 8 5 12 14 21 15 18 14"| ruby quartiles.rb

size = gets.strip.to_i
nums = gets.strip.split.map(&:to_i).sort

def median(nums)
  size = nums.size

  if size.odd?
    m = ((size + 1) / 2) - 1
    [[nums[0...m], nums[m + 1..-1]], nums[m]]
  else
    mli = (size / 2) - 1
    mhi = (size / 2)
    [[nums[0..mli], nums[mhi..-1]], (nums[mli] + nums[mhi]) / 2.0]
  end
end

hs, m = median(nums)

puts median(hs.first).last
puts m
puts median(hs.last).last
