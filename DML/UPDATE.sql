-- UPDATE: Modifies existing data in a table

-- Update a single column:
UPDATE github.repository
SET var = 'T-SQL'
WHERE id = 1;

-- Update multiple columns:
UPDATE github.repository
SET var = 'C#', precise = 456.78
WHERE organization_id = 1;

-- Safer update with transaction:
BEGIN TRANSACTION;
UPDATE github.repository
SET var = 'Rust'
WHERE id = 3;
COMMIT; -- or use ROLLBACK to undo if needed
