require 'test/unit'
require 'mocha'
require 'stats'

class TestStats < Test::Unit::TestCase
  def setup
    Stats.instance_variable_set(:@redis, nil)
  end

  def test_should_initialize_redis_with_host_port
    Redis.expects(:new).with(:host        => 'localhost',
                             :port        => '6379',
                             :db          => nil,
                             :thread_safe => true).returns(mock('redis'))
    Stats.redis = 'localhost:6379'
  end

  def test_should_initialize_redis_with_host_port_db
    Redis.expects(:new).with(:host        => 'localhost',
                             :port        => '6379',
                             :db          => 'stats',
                             :thread_safe => true).returns(mock('redis'))
    Stats.redis = 'localhost:6379:stats'
  end

  def test_should_initialize_redis_if_not_set
    Redis.expects(:new).with(:host        => 'localhost',
                             :port        => '6379',
                             :db          => nil,
                             :thread_safe => true).returns(mock('redis'))
    Stats.redis
  end

  def test_should_set
    Stats.redis = mock('redis')
    Stats.redis.expects(:set).with("load", 2.1)
    Stats.set("load", 2.1)
  end

  def test_should_get
    Stats.redis = mock('redis')
    Stats.redis.expects(:get).with("load").returns(1.1)
    assert_equal 1.1, Stats.get("load")
  end

  def test_should_incr_by_one
    Stats.redis = mock('redis')
    Stats.redis.expects(:incrby).with("downloads", 1)
    Stats.incr("downloads")
  end

  def test_should_incr_by_many
    Stats.redis = mock('redis')
    Stats.redis.expects(:incrby).with("purchased_items", 5)
    Stats.incr("purchased_items", 5)
  end

  def test_should_decr_by_one
    Stats.redis = mock('redis')
    Stats.redis.expects(:decrby).with("invitations", 1)
    Stats.decr("invitations")
  end

  def test_should_decr_by_many
    Stats.redis = mock('redis')
    Stats.redis.expects(:decrby).with("tickets_left", 4)
    Stats.decr("tickets_left", 4)
  end

  def test_should_clear
    Stats.redis = mock('redis')
    Stats.redis.expects(:del).with("downloads")
    Stats.clear("downloads")
  end
end
