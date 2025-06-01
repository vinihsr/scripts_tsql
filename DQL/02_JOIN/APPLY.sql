-- Placeholder function for demonstration:
SELECT r.id, f.detail
FROM github.repository AS r
CROSS APPLY dbo.fn_get_details(r.id) AS f;


-- Example 8: APPLY operator (OUTER APPLY)
SELECT r.id, f.detail
FROM github.repository AS r
OUTER APPLY dbo.fn_get_details(r.id) AS f;
