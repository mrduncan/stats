module Stats
  module Helpers
    # Sets the Redis server with the specified url or Redis object.
    def redis=(server)
      case server
      when /redis:\/\//
        @redis = Redis.connect({ :url => server, :thread_safe => true })
      when String
        # Backward compatibility only, not recommended.
        host, port, db = server.split(':')
        @redis = Redis.new(:host => host, :port => port, :db => db, :thread_safe => true)
      else
        @redis = server
      end
    end

    # Returns the current Redis connection.  A default connection will be made
    # if one doesn't yet exist.
    def redis
      return @redis if @redis
      self.redis = 'redis://127.0.0.1:6379/0'
      self.redis
    end
  end
end
