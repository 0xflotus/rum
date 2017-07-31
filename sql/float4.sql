set enable_seqscan=off;

CREATE TABLE test_float4 (
	i float4
);

INSERT INTO test_float4 VALUES (-2),(-1),(0),(1),(2),(3);

CREATE INDEX idx_float4 ON test_float4 USING rum (i);

SELECT * FROM test_float4 WHERE i<1::float4 ORDER BY i;
SELECT * FROM test_float4 WHERE i<=1::float4 ORDER BY i;
SELECT * FROM test_float4 WHERE i=1::float4 ORDER BY i;
SELECT * FROM test_float4 WHERE i>=1::float4 ORDER BY i;
SELECT * FROM test_float4 WHERE i>1::float4 ORDER BY i;

EXPLAIN (costs off)
SELECT *, i <=> 0::float4 FROM test_float4 ORDER BY i <=> 0::float4;
SELECT *, i <=> 0::float4 FROM test_float4 ORDER BY i <=> 0::float4;

EXPLAIN (costs off)
SELECT *, i <=> 1::float4 FROM test_float4 WHERE i<1::float4 ORDER BY i <=> 1::float4;
SELECT *, i <=> 1::float4 FROM test_float4 WHERE i<1::float4 ORDER BY i <=> 1::float4;
