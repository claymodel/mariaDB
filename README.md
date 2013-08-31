MyISAM 	Features
------------------
Not ACID compliant and non-transactional 	


MySQL 5.0 Default Engine 	

Offers Compression 	

Requires full repair/rebuild of indexes/tables 	

Changed Db pages written to disk instantly 	

No ordering in storage of data

Table level locking 	

Innodb Features
----------------

ACID compliant and hence fully transactional with ROLLBACK and COMMIT and support for Foreign Keys

Rackspace Cloud Default Engine

Offers Compression

Auto recovery from crash via replay of logs

Dirty pages converted from random to sequential before commit and flush to disk

Row data stored in pages in PK order

Row level locking

TokuDB
--------

TokuDB is a high-performance, transactional storage engine

Uses Fractal Tree indexes which give it liability to deal with the
high speed transaction shifting the capacity siply from GB to TB scale.

The B-Tree indexing is used in the InnoDB and MyISAM storage engine.

The Data Structure BTree and Fractal Tree explains well the advantages of
high volume transaction and large chunk data storage. Fractal Tree is 
best.


Benchmarking
-------------

CREATE TABLE `sensordata` (
  `ts` int(10) unsigned NOT NULL DEFAULT '0',
  `sensor_id` int(10) unsigned NOT NULL,
  `data1` double NOT NULL,
  `data2` double NOT NULL,
  `data3` double NOT NULL,
  `data4` double NOT NULL,
  `data6` double NOT NULL,
  `cnt` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sensor_id`,`ts`)
)

MySQL Versions:

    For InnoDB tests I used Percona Server 5.6-RC2
    For TokuDB tests I used mariadb-5.5.30-tokudb-7.0.4 from Tokutek website

So, first, let’s load data into InnoDB, again, I am using LOAD DATA INFILE statement

    InnoDB, no compression. Load time is 1 hour 26 min 25.77 sec, final table size is 90GB
    InnoDB, 8K compression. Load time 3 hours 26 min 17.06 sec, the table size is 45GB
    InnoDB, 4K compression. Load time 17 hours 23 min 43.48 sec, the table size is 26GB

Now for TokuDB:

    TokuDB, default compression. Load time 33 min 1.18 sec, the table size on disk is 10GB
    TokuDB, tokudb_small table format. Load time 37 min 2.34 sec, the table size is 4.6GB
