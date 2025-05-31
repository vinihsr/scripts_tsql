-- DATABASE

-- To modify database properties (e.g., change file size, growth, etc.)
ALTER DATABASE git
MODIFY FILE (
    NAME = git_data,
    SIZE = 20MB
);

-- To change collation of a database
ALTER DATABASE git COLLATE SQL_Latin1_General_CP1_CI_AS;


-- ROLE

-- Add a member to a role
ALTER ROLE devs ADD MEMBER vinicius;

-- Remove a member from a role
ALTER ROLE devs DROP MEMBER vinicius;


-- USER

-- To change user default schema
ALTER USER vinicius WITH DEFAULT_SCHEMA = github;


-- SCHEMA

-- Rename a schema is not supported, must recreate and migrate objects if needed.


-- TABLE

-- To add a column
ALTER TABLE github.repository ADD stars INT DEFAULT 0;

-- To drop a column
ALTER TABLE github.repository DROP COLUMN stars;

-- To modify a column type (e.g., change VARCHAR to NVARCHAR)
ALTER TABLE github.repository ALTER COLUMN var NVARCHAR(200);

-- To add a constraint (e.g., unique)
ALTER TABLE github.repository
ADD CONSTRAINT uq_precise UNIQUE (precise);

-- To drop a constraint
ALTER TABLE github.repository
DROP CONSTRAINT uq_precise;

-- To enable or disable constraints (e.g., for data import)
ALTER TABLE github.repository NOCHECK CONSTRAINT ALL;
ALTER TABLE github.repository CHECK CONSTRAINT ALL;


-- INDEX

-- To rebuild an index (optimize it)
ALTER INDEX idx_linguagem ON github.repository REBUILD;

-- To disable an index
ALTER INDEX idx_linguagem ON github.repository DISABLE;


-- VIEW

-- You can't directly `ALTER VIEW`, but you can redefine it
ALTER VIEW github.vw_repos_python AS
SELECT id, var FROM github.repository WHERE var = 'SQL';


-- PROCEDURE

-- Redefine a stored procedure
ALTER PROCEDURE github.sp_repos_linguagem @language VARCHAR(50)
AS
BEGIN
    SELECT id, var FROM github.repository WHERE var = @language;
END;


-- FUNCTION

-- Redefine a scalar function
ALTER FUNCTION github.fn_conta_repos ()
RETURNS INT
AS
BEGIN
    DECLARE @total INT;
    SELECT @total = COUNT(*) FROM github.repository;
    RETURN @total;
END;


-- TRIGGER

-- Redefine a trigger
ALTER TRIGGER github.tr_audit_insert
ON github.repository
AFTER INSERT
AS
BEGIN
    PRINT 'Repositório inserido com sucesso!';
END;
