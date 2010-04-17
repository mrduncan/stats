Stats
=====

Requires the redis gem.

Easily keep track of vital stats using Redis.

There are currently three types of statistics that Stats captures:

1. Simple
---------
Simple stats are meant to be updated periodically.  Only the latest value is
kept.

    Stats.set("load", System.load)

2. Counts
---------
Counts can be incremented and decremented.  Only the latest value is kept.

    Stats.incr("downloads")

3. Timings
----------
Timings are used to keep track of the time it takes to run a block.  All values
are kept so that they can be graphed/analyzed.

    Stats.time("archive") { file.archive }


Installation
------------

    $ gem install stats


Author
------

Matt Duncan
matt@mattduncan.org
