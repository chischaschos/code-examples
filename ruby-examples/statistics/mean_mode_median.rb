# Calculating Mean, Mode and Median
#
# Implementation of https://www.hackerrank.com/challenges/s10-basic-statistics
#
# Usage:
#
# $ echo "10 \n64630 11735 14216 99233 14470 4978 73429 38120 51135 67060"|ruby mean-mode-median.rb
#
# TODO: https://www.quora.com/What-is-the-most-efficient-algorithm-for-calculating-the-mode-of-an-array-of-integers

class Array
  def mean
    map(&:to_i).sort.reduce(&:+) / size.to_f
  end

  def median
    sorted_nums = map(&:to_i).sort
    mid_index = (size / 2).floor - 1
    mid_nums = if size.odd?
                 [sorted_nums[mid_index + 1], sorted_nums[mid_index + 1]]
               else
                 [sorted_nums[mid_index], sorted_nums[mid_index + 1]]
               end
    mid_nums.reduce(&:+) / 2.0
  end

  def mode
    sorted_nums = map(&:to_i).sort
    largest_occurrence = 1
    histogram = Hash.new(0)

    occurrences = sorted_nums.each_with_object(histogram) do |e, h|
      h[e] += 1
      largest_occurrence = h[e] if h[e] > largest_occurrence
      h
    end

    grouped = occurrences.group_by { |_, v| v }
    grouped[largest_occurrence].sort_by { |k, _| k }.first.first
  end
end

_ = gets.strip.to_i
nums = gets.strip.split

puts nums.mean
puts nums.median
puts nums.mode
