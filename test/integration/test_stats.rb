require 'test/unit'
require 'mocha'
require 'stats'

class TestStats < Test::Unit::TestCase
  def setup
    Stats.redis = 'localhost:6379:stats_test'
    Stats.redis.flush_db
  end

  def test_should_set
    Stats.set("load", 1.2)
    assert_equal 1.2, Stats.get("load").to_f
    Stats.set("load", 1.7)
    assert_equal 1.7, Stats.get("load").to_f
  end

  def test_should_increment
    assert_equal 0, Stats.get("downloads").to_i
    Stats.incr("downloads")
    assert_equal 1, Stats.get("downloads").to_i
    Stats.incr("downloads", 2)
    assert_equal 3, Stats.get("downloads").to_i
  end

  def test_should_decrement
    Stats.set("invitations", 100)
    Stats.decr("invitations")
    assert_equal 99, Stats.get("invitations").to_i
    Stats.decr("invitations", 4)
    assert_equal 95, Stats.get("invitations").to_i
  end

  def test_should_clear
    Stats.set("space_left", 100)
    Stats.clear("space_left")
    assert_nil Stats.get("space_left")
  end

  def test_should_time
    Benchmark.expects(:realtime).returns(2)
    Stats.time("archive") { "takes 2" }
    Benchmark.expects(:realtime).returns(3)
    Stats.time("archive") { "takes 3" }
    assert_equal [2, 3], Stats.get_times("archive")
  end
end
