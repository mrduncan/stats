require 'test/unit'
require 'mocha'
require 'stats'

class TestStats < Test::Unit::TestCase
  def test_should_average
    assert_equal 2.0, Stats::TimingStat.new([1, 2, 2, 3]).average
  end

  def test_should_get_population_variance
    assert_equal 0.25, Stats::TimingStat.new([1, 1, 2, 2]).population_variance
  end

  def test_should_get_standard_deviation
    assert_equal 0.5, Stats::TimingStat.new([1, 1, 2, 2]).standard_deviation
  end
end
