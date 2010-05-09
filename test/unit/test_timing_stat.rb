require 'test/unit'
require 'mocha'
require 'stats'

class TestStats < Test::Unit::TestCase
  def test_should_avg
    assert_equal 2.0, Stats::TimingStat.new([1, 2, 2, 3]).avg
  end

  def test_should_have_avg_of_nil_with_no_data
    assert_nil Stats::TimingStat.new([]).avg
  end

  def test_should_get_pop_var
    assert_equal 0.25, Stats::TimingStat.new([1, 1, 2, 2]).pop_var
  end

  def test_should_have_pop_var_of_nil_with_no_data
    assert_nil Stats::TimingStat.new([]).pop_var
  end

  def test_should_get_std_dev
    assert_equal 0.5, Stats::TimingStat.new([1, 1, 2, 2]).std_dev
  end

  def test_should_have_std_dev_of_nil_with_no_data
    assert_nil Stats::TimingStat.new([]).std_dev
  end
end
