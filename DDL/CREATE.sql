-- ALL CREATE OPTIONS THAT YOU CAN DO!!!

-- to create a default database
CREATE DATABASE git;


-- or
-- to create a database with specifications
CREATE DATABASE git
ON ( -- data file (.mdf)
    NAME = git_data,
    FILENAME = 'C:\Databases\git_data.mdf',
    SIZE = 10MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
)
LOG ON ( -- log file (.ldf)
    NAME = git_log,
    FILENAME = 'C:\Databases\git_log.ldf',
    SIZE = 5MB,
    MAXSIZE = 50MB,
    FILEGROWTH = 5MB
);


-- to create a role
CREATE ROLE devs;


-- to create a user
CREATE USER vinicius FOR LOGIN vinicius_login;
-- ALTER ROLE devs ADD MEMBER vinicius; -- to add user on a role


-- to create a schema
CREATE SCHEMA github; 


-- to create a simple table
CREATE TABLE github.repository (
    id INT -- name and type
);


-- to create a table (look for the types)
CREATE TABLE github.repository (
    id INT IDENTITY(1,1) PRIMARY KEY,                           -- primary key: auto-increment integer
    tiny TINYINT DEFAULT 1,                                     -- tinyint: 0 to 255, great for flags or small counters
    small SMALLINT,                                             -- smallint: integer from -32,768 to 32,767
    normal INT,                                                 -- int: standard integer
    big BIGINT,                                                 -- bigint: very large integer values
    precise DECIMAL(10, 2),                                     -- decimal: fixed precision, good for currency
    approximate FLOAT,                                          -- float: approximate floating point number
    real_number REAL,                                           -- real: less precise float (about 7 digits)
    char_col CHAR(5),                                           -- char: fixed-length string
    var Varchar(100),                                           -- varchar: variable-length string
    nvarchar_col NVARCHAR(100),                                 -- nvarchar: unicode variable-length string
    text_col TEXT,                                              -- text: deprecated long string (use varchar(max) instead)
    date_col DATE,                                              -- date: only date, no time
    time_col TIME,                                              -- time: only time, no date
    datetime_col DATETIME,                                      -- datetime: date + time (till 3 ms precision)
    datetime2_col DATETIME2(7),                                 -- datetime2: extended precision datetime
    smalldate_col SMALLDATETIME,                                -- smalldatetime: less precision, less storage
    bool_col BIT DEFAULT 0,                                     -- bit: 0 or 1 (boolean-like)
    binary_col BINARY(4),                                       -- binary: fixed-size binary data
    varbinary_col VARBINARY(MAX),                               -- varbinary: variable binary data, good for files
    xml_col XML,                                                -- xml: stores xml data
    unique_col UNIQUEIDENTIFIER DEFAULT NEWID(),                -- uniqueidentifier: GUID
    hierarchy_col HIERARCHYID,                                  -- hierarchyid: tree structure data
    geo_col GEOGRAPHY,                                          -- geography: spatial data (e.g. GPS)
    geometry_col GEOMETRY,                                      -- geometry: 2D spatial data
    variant_col SQL_VARIANT,                                    -- sql_variant: flexible, stores multiple types
    cursor_col CURSOR,                                          -- cursor: used internally, not commonly in table defs
    token_col ROWVERSION,                                       -- rowversion: auto-incrementing binary (versioning)
    organization_id INT,                                        -- foreign key: linking to organization table
    CONSTRAINT fk_org FOREIGN KEY (organization_id) REFERENCES github.organization(id)
);


-- to create an index
CREATE INDEX idx_linguagem ON github.repository (var);


-- to create a view
CREATE VIEW github.vw_repos_python AS
SELECT * FROM github.repository
WHERE var = 'SQL';


-- to create a procedure
CREATE PROCEDURE github.sp_repos_linguagem @language VARCHAR(50)
AS
BEGIN
    SELECT * FROM github.repository WHERE var = @language;
END;


-- to create a function
CREATE FUNCTION github.fn_conta_repos ()
RETURNS INT
AS
BEGIN
    DECLARE @total INT;
    SELECT @total = COUNT(*) FROM github.repository;
    RETURN @total;
END;


-- to create a trigger
CREATE TRIGGER github.tr_audit_insert
ON github.repository
AFTER INSERT
AS
BEGIN
    PRINT 'Novo repositório inserido!';
END;