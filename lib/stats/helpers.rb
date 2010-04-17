module Stats
  module Helpers
    # Sets the Redis server with the specified 'hostname:port[:db]' string or
    # Redis object.
    def redis=(server)
      case server
      when String
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
      self.redis = 'localhost:6379'
      self.redis
    end
  end
end
