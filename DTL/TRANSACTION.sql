-- BEGIN TRANSACTION: starts a transaction block

BEGIN TRANSACTION;

-- Example operation
UPDATE github.repository
SET var = 'TypeScript'
WHERE var = 'JavaScript';

-- At this point, decide to COMMIT or ROLLBACK
-- COMMIT;
-- ROLLBACK;
