-- DELETE: Removes rows from a table

-- Delete a specific row:
DELETE FROM github.repository
WHERE id = 1;

-- Delete multiple rows:
DELETE FROM github.repository
WHERE var = 'Python';

-- ⚠️ Delete all rows (use with caution):
DELETE FROM github.repository;

-- Show deleted rows using OUTPUT:
DELETE FROM github.repository
OUTPUT DELETED.*
WHERE id = 2;
