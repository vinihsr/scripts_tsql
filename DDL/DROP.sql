-- DATABASE
DROP DATABASE git;

-- ROLE
DROP ROLE devs;

-- USER
DROP USER vinicius;

-- SCHEMA
DROP SCHEMA github; -- Must be empty before dropping

-- TABLE
DROP TABLE github.repository;

-- COLUMN
-- No direct DROP COLUMN (must be done through ALTER TABLE github.repository DROP COLUMN stars;)

-- CONSTRAINT
-- No direct DROP CONSTRAINT (use ALTER TABLE ... DROP CONSTRAINT)

-- INDEX
DROP INDEX idx_linguagem ON github.repository;

-- VIEW
DROP VIEW github.vw_repos_python;

-- PROCEDURE
DROP PROCEDURE github.sp_repos_linguagem;

-- FUNCTION
DROP FUNCTION github.fn_conta_repos;

-- TRIGGER
DROP TRIGGER github.tr_audit_insert;

-- FILE (from database)
ALTER DATABASE git REMOVE FILE git_log;
