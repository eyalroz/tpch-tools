-- These queries create auxiliary tables for each schema table,
-- with columns correponding to most of the fixed-size CHAR()-type
-- columns of the original: Those columns whose number of characters
-- is at most 4. They're recast as numbers - with the same 
-- in-memory values as the character sequence as the original,
-- assuming a little-endian machine - to facilitate compression
-- (by not having to "deal" with strings).

CREATE TABLE lineitem_casts (
l_returnflag    TINYINT       NOT NULL,
l_linestatus    TINYINT       NOT NULL
);

INSERT INTO lineitem_casts SELECT
ascii(substr(l_returnflag,   1,1)) AS l_returnflag,
ascii(substr(l_linestatus, 1,1)) AS l_linestatus
FROM lineitem;

CREATE TABLE orders_casts (
o_orderstatus    TINYINT       NOT NULL
);

INSERT INTO orders_casts SELECT
ascii(substr(o_orderstatus,   1,1)) AS o_orderstatus
FROM orders;
