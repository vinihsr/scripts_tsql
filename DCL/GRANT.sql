-- GRANT: gives permissions to users or roles

-- Grant SELECT permission on a table to a user
GRANT SELECT ON github.repository TO vinicius;

-- Grant INSERT, UPDATE, DELETE to a role
GRANT INSERT, UPDATE, DELETE ON github.repository TO devs;

-- Grant EXECUTE permission on a procedure
GRANT EXECUTE ON github.sp_repos_linguagem TO vinicius;
