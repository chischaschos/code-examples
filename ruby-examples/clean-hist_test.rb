require 'minitest/autorun'
require_relative 'clean-hist'

class CleanHistTest < Minitest::Test
  def test_remove_single_duplicated_line
    data = [
      ": 1461015276:0;rbevn install 2.4.0\n",
      ": 1461015277:0;rbevn install 2.4.0\n",
      ": 1461014883:0;rcup -v\n"
    ]

    clean_data = CleanHist.new(data.join).clean

    data.delete_at(1)
    assert_equal(data.join("\n"), clean_data)
  end

  def test_removes_multiline_entries
    data = [
      ": 1477420471:0;ls \\\n",
      " && ls\n",
      ": 1477420472:0;ls \\\n",
      " && ls\n"
    ]

    clean_data = CleanHist.new(data.join).clean

    data.delete_at(2)
    data.delete_at(3)
    assert_equal(data[0] + data[1], clean_data)
  end

  def test_split_lines
    data = [
      ": 1461015276:0;rbevn install 2.4.0\n",
      ": 1461014883:0;rcup -v\n"
    ]

    clean_hist = CleanHist.new(data.join)

    assert_equal(2, clean_hist.lines.count)
    assert_equal(data.first, clean_hist.lines.first)
    assert_equal(data.last, clean_hist.lines.last)
  end

  def test_split_multilines
    data = [
      ": 1461015276:0;rbevn install 2.4.0\n",
      ": 1461014883:0;rcup -v \\\n",
      "&& ls\n"
    ]

    clean_hist = CleanHist.new(data.join)

    assert_equal(2, clean_hist.lines.count)
    assert_equal(data.first, clean_hist.lines.first)
    assert_equal(data[1] + data[2], clean_hist.lines.last)
  end
end
