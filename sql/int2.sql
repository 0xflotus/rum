set enable_seqscan=off;

CREATE TABLE test_int2 (
	i int2
);

INSERT INTO test_int2 VALUES (-2),(-1),(0),(1),(2),(3);

CREATE INDEX idx_int2 ON test_int2 USING rum (i);

SELECT * FROM test_int2 WHERE i<1::int2 ORDER BY i;
SELECT * FROM test_int2 WHERE i<=1::int2 ORDER BY i;
SELECT * FROM test_int2 WHERE i=1::int2 ORDER BY i;
SELECT * FROM test_int2 WHERE i>=1::int2 ORDER BY i;
SELECT * FROM test_int2 WHERE i>1::int2 ORDER BY i;

EXPLAIN (costs off)
SELECT *, i <=> 0::int2 FROM test_int2 ORDER BY i <=> 0::int2;
SELECT *, i <=> 0::int2 FROM test_int2 ORDER BY i <=> 0::int2;

EXPLAIN (costs off)
SELECT *, i <=> 1::int2 FROM test_int2 WHERE i<1::int2 ORDER BY i <=> 1::int2;
SELECT *, i <=> 1::int2 FROM test_int2 WHERE i<1::int2 ORDER BY i <=> 1::int2;
