Stats
=====

Requires the redis gem.

Easily keep track of vital stats using Redis.

Usage
-----
There are currently three types of statistics that Stats captures:

### 1. Simple
Simple stats are meant to be updated periodically.  Only the latest value is
kept.

    Stats.set("load", System.load)

### 2. Counts
Counts can be incremented and decremented.  Only the latest value is kept.

    Stats.incr("downloads")

### 3. Timings
Timings are used to keep track of the time it takes to run a block.  All values
are kept so that they can be graphed/analyzed.

    Stats.time("archive") { file.archive }

### Redis
By default, the Redis server at `redis://127.0.0.1:6379/0` will be used.  You
can set it by either specifying a url or a Redis instance.

    Stats.redis = "redis://127.0.0.1:6379/0"

    Stats.redis = redis_instance

The current Redis instance can also be accessed.

    puts Stats.redis.info

Installation
------------

    $ gem install stats


Author
------
Matt Duncan | [mattduncan.org](http://mattduncan.org) | [matt@mattduncan.org](mailto:matt@mattduncan.org)
