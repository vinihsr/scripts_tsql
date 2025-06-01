-- JOIN: Combine rows from two or more tables based on a related column

-- Example 1: INNER JOIN
SELECT r.id, r.var, o.name
FROM github.repository AS r
INNER JOIN github.organization AS o
    ON r.organization_id = o.id;


-- Example 2: LEFT JOIN
SELECT r.id, r.var, o.name
FROM github.repository AS r
LEFT JOIN github.organization AS o
    ON r.organization_id = o.id;


-- Example 3: RIGHT JOIN
SELECT r.id, r.var, o.name
FROM github.repository AS r
RIGHT JOIN github.organization AS o
    ON r.organization_id = o.id;


-- Example 5: CROSS JOIN
SELECT r.id, o.name
FROM github.repository AS r
CROSS JOIN github.organization AS o;


-- Example 6: SELF JOIN (maybe useful)
SELECT a.id AS repo_a, b.id AS repo_b
FROM github.repository AS a
JOIN github.repository AS b
    ON a.organization_id = b.organization_id
    AND a.id <> b.id;
