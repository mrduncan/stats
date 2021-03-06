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

  # Alias of `get`
  def [](name)
    get(name)
  end

  # Increments the stat with the specified name.
  def incr(name, by = 1)
    Stats.redis.incrby(name, by)
  end

  # Increments the stat with the specified name by 1.
  def <<(name)
    incr(name)
  end

  # Decrements the stat with the specified name.
  def decr(name, by = 1)
    Stats.redis.decrby(name, by)
  end

  # Decrements the stat with the specified name by 1.
  def >>(name)
    decr(name)
  end

  # Returns the value of the counter with the specified name.
  def counter(name)
    Stats.redis.get(name).to_i
  end

  # Clears the stat with the specified name.
  def clear(name)
    Stats.redis.del(name)
  end
end
