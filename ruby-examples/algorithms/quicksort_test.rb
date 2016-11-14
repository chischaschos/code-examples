require 'minitest/autorun'
require 'bundler/setup'
Bundler.require

require 'open-uri'
require_relative 'quicksort'

class QuickTest < Minitest::Test

  def test_empty
    list = []

    Quick.sort(list)

    assert_sorted(list)
  end

  def test_1
    list = [1]

    Quick.sort(list)

    assert_sorted(list)
  end

  def test_0_0
    list = [0, 0]

    Quick.sort(list)

    assert_sorted(list)
  end

  def test_0_1
    list = [0, 1]

    Quick.sort(list)

    assert_sorted(list)
  end

  def test_1_0
    list = [1, 0]

    Quick.sort(list)

    assert_sorted(list)
  end

  def test_10_1_0_2_100
    list = [10, 1, 0, 2, 100]

    Quick.sort(list)

    assert_sorted(list)
  end

  def test_sort_10_000
    data = open('http://algs4.cs.princeton.edu/23quicksort/antiquicksort10K.txt')
    list = data.map(&:to_i)

    Quick.sort(list)

    assert_sorted(list)
  end

  def assert_sorted(list)
    return if list.empty? || list.size == 1

    i = 0
    loop do
      assert(list[i] <= list[i + 1], "list not sorted around index #{i} with #{list[i]}:#{list[i - 2 .. i + 2]}")
      i += 1
      break if i + 1 == list.size
    end
  end

end
