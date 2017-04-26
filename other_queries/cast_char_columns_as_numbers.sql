-- These queries create auxiliary tables for each schema table,
-- with columns correponding to most of the fixed-size CHAR()-type
-- columns of the original: Those columns whose number of characters
-- is at most 4. They're recast as numbers - with the same 
-- in-memory values as the character sequence as the original,
-- assuming a little-endian machine - to facilitate compression
-- (by not having to "deal" with strings).
--
-- Note: We're not separating the suffix "casts" with an underscore,
-- due to naming ambiguity issues in MonetDB, where the SQL catalog
-- uses "tablename_columnname", so "table_name_column_name" is ambiguous
-- and can only be disambiguated using another table lookup (e.g. 
-- the storage table)

CREATE TABLE lineitemcasts (
l_returnflag    TINYINT       NOT NULL,
l_linestatus    TINYINT       NOT NULL
);

INSERT INTO lineitemcasts SELECT
ascii(substr(l_returnflag,   1,1)) AS l_returnflag,
ascii(substr(l_linestatus, 1,1)) AS l_linestatus
FROM lineitem;

CREATE TABLE orderscasts (
o_orderstatus    TINYINT       NOT NULL
);

INSERT INTO orderscasts SELECT
ascii(substr(o_orderstatus,   1,1)) AS o_orderstatus
FROM orders;
