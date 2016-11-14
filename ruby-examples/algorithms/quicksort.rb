# = Quicksort
#
# == Main features
# - Sorts in-place, uses small auxiliary stack
# - O(nlogn)
# - Fragile, needs to be carefully implemented
#
# == Main strategy
# - Divide-and-conquer method for sorting
# - Partitions an array into two subarrays, then sorts subarrays independently
#
# == Partitioning
# - The partitioning process that rearranges the array to make the following three conditions hold:
#   - The entry a[j] is in its final place.
#   - No entry from a[lo] to a[j - 1] is greater than a[j].
#   - No entry from a[j + 1] to a[hi] is less than a[j].
# - Choose an arbitrary a[lo]
#   - It will end up in its final position.
# - Scan from left to right until we find an element bigger than or equal.
#   - Left to right a[j] increases.
# - Scan from right to left until we find an element smaller or equal.
#   - Right to left a[i] decreases.
# - Swap the elements where the scan stopped.
#   - This elements are out of place in the final partitioned array.
# - When the indices cross all we need to do is exchange a[lo] with a[j], and return index
# j.
#   - i.e. exchange pivot with rightmost element of left subarray.
#
# == Randomizing
# - Array is randomized before sorting so that we can predict its performance.
#
# == Comparison
# - Mergesort
#   - Does two recursive calls before working on the whole array
#   - Array is divided in half
# - Quicksort
#   - Works on the whole array before doing two recursive calls
#   - Position of partition depends on the contents of the array
module Quick
  module_function

  def sort(a)
    a.shuffle!
    rsort(a, 0, a.length - 1)
  end

  def rsort(a, lo, hi)
    return if hi <= lo

    j = partition(a, lo, hi)

    rsort(a, lo, j - 1)
    rsort(a, j + 1, hi)
  end

  def partition(a, lo, hi)
    v = a[lo]                 # get a[lo] that will end up in the final position
    l = lo + 1                # we start one after the lower index
    r = hi

    loop do
      # now go left to right and stop on:
      # after comparison we check if we haven't reached bounds
      while less(a[l], v) do  # 1. the bigger than or equal to v element
        break if l == hi      # 2. the end of the array
        l += 1
      end

      # now go right to left and stop on:
      # after comparison we check if we haven't reached bounds
      while less(v, a[r]) do  # 1. the smaller than v element
        break if r == lo      # 2. the beginning of the array
        r -= 1
      end

      break if l >= r         # 3. stop on the cross

      a[l], a[r] = a[r], a[l] # exchange elements
    end

    # why from r instead of l?
    a[r], a[lo] = a[lo], a[r] # exchange rightmost entry of the left
    r                         # return index of partition element
  end

  def less(a, b)
    (a <=> b) < 0
  end
end
