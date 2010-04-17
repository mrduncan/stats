require 'benchmark'
require 'redis'
require 'stats/helpers'
require 'stats/times'
require 'stats/timing_stat'

module Stats
  extend self
  extend Helpers
  extend Times

  # Sets the stat with the specified name.
  def set(name, value)
    Stats.redis.set(name, value)
  end

  # Returns the value with the specified name.
  def get(name)
    Stats.redis.get(name)
  end

  # Increments the stat with the specified name.
  def incr(name, by = 1)
    Stats.redis.incrby(name, by)
  end

  # Decrements the stat with the specified name.
  def decr(name, by = 1)
    Stats.redis.decrby(name, by)
  end

  # Clears the stat with the specified name.
  def clear(name)
    Stats.redis.del(name)
  end
end
