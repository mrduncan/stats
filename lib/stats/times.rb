module Stats
  module Times
    # Returns the timing data for the stat with the specified name.
    def get_times(name)
      times = Stats.redis.lrange(name, 0, -1)
      TimingStat.new(times.map { |t| t.to_f })
    end

    # Adds a new time for the stat with the specified name.
    def time(name, &block)
      raise ArgumentError.new("Block required to time.") unless block
      realtime = Benchmark.realtime { block.call }
      Stats.redis.rpush(name, realtime)
    end
  end
end
