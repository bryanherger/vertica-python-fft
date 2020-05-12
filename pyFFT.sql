-- Step 1: Create library
-- be sure to install numpy into all nodes of your Vertica cluster as described in the README
\set libfile '\'/home/bryan/udx/pyFFT.py\''
CREATE LIBRARY TransformFunctions AS :libfile LANGUAGE 'Python';

-- Step 2: Create functions
CREATE TRANSFORM FUNCTION pyFFT AS NAME 'pyFFTFactory' LIBRARY TransformFunctions;

-- Step 3: Use Functions
-- create a data set of amplitude vs. time
CREATE TABLE t (a FLOAT, b FLOAT);
INSERT INTO t VALUES (0,0);
INSERT INTO t VALUES (0.001,0.141120008);
INSERT INTO t VALUES (0.002,-0.279415498);
INSERT INTO t VALUES (0.003,0.412118485);
INSERT INTO t VALUES (0.004,-0.536572918);
INSERT INTO t VALUES (0.005,0.65028784);
INSERT INTO t VALUES (0.006,-0.750987247);
INSERT INTO t VALUES (0.007,0.836655639);
INSERT INTO t VALUES (0.008,-0.905578362);
INSERT INTO t VALUES (0.009,0.956375928);
INSERT INTO t SELECT a+0.01, 0.0 FROM t;
INSERT INTO t SELECT a+0.02, 0.0 FROM t;
INSERT INTO t SELECT a+0.04, 0.0 FROM t;
INSERT INTO t SELECT a+0.08, 0.0 FROM t;
INSERT INTO t SELECT a+0.16, 0.0 FROM t;
INSERT INTO t SELECT a+0.32, 0.0 FROM t;
INSERT INTO t SELECT a+0.64, 0.0 FROM t;
UPDATE t SET b = sin(40 * 2 * 3.14 * a) + 0.5 * sin(90 * 2 * 3.14 * a);
SELECT * FROM t;
-- Run the FFT and output amplitude vs. frequency
SELECT pyFFT(a, b) OVER() FROM t;

-- Step 4: Clean up
DROP TABLE t;
DROP LIBRARY TransformFunctions CASCADE;
