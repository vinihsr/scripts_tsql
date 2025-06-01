-- FROM: Define the source tables for the query

-- Example 1: Select from a single table
SELECT *

FROM github.repository;



-- Example 2: Select specific columns from a table
SELECT id, var, datetime_col

FROM github.repository;



-- Example 3: Select from multiple tables using alias (without JOIN yet)
SELECT r.id, o.name

FROM github.repository AS r, github.organization AS o;



-- Example 4: Select from a subquery (inline view)
SELECT name

FROM (
    SELECT id, name FROM github.organization
) AS orgs;

-- Example 5: Select from a table-valued function (if one exists)
-- This is an example placeholder, assuming a function exists
-- SELECT * FROM dbo.fn_get_repositories();
