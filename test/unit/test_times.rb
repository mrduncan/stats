require 'test/unit'
require 'mocha'
require 'stats'

class TestStats < Test::Unit::TestCase
  def test_should_add_timing
    Stats.redis = mock('redis')
    Stats.redis.expects(:rpush).with("archive", 1)
    Benchmark.expects(:realtime).returns(1)
    Stats.time("archive") { "noop" }
  end

  def test_should_raise_arguement_error_when_timing_without_block
    assert_raise(ArgumentError) do
      Stats.time("archive")
    end
  end

  def test_should_get_times
    Stats.redis = mock('redis')
    Stats.redis.expects(:lrange).with("archive", 0, -1).returns(["1", "2"])
    assert_equal [1, 2], Stats.get_times("archive")
  end
end
