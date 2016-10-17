# Calculating Mean, Mode and Median
#
# Implementation of https://www.hackerrank.com/challenges/s10-basic-statistics
#
# Usage:
#
# $ echo "10 \n64630 11735 14216 99233 14470 4978 73429 38120 51135 67060"|ruby mean-mode-median.rb
#
# TODO: https://www.quora.com/What-is-the-most-efficient-algorithm-for-calculating-the-mode-of-an-array-of-integers
nums_count = gets.strip.to_i
nums = gets.strip.split


sorted_nums = nums.map(&:to_i).sort
mid_index = (nums_count / 2).floor - 1
mid_nums = nums_count.odd? ? [sorted_nums[mid_index + 1],  sorted_nums[mid_index + 1]] : [sorted_nums[mid_index],  sorted_nums[mid_index + 1]]


puts sorted_nums.reduce(&:+) / nums_count.to_f
puts mid_nums.reduce(&:+) / 2.0

mode = sorted_nums.first
largest_occurrence = 1
occurrences = sorted_nums.reduce(Hash.new {|h, k| h[k] = 0}) do |h, e|
  h[e] += 1
  if h[e] > largest_occurrence
    largest_occurrence = h[e]
  end
  h
end

grouped = occurrences.group_by {|h, v| v}
puts grouped[largest_occurrence].sort_by {|k,v| k}.first.first
