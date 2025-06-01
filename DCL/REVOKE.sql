-- REVOKE: removes previously granted permissions

-- Revoke SELECT permission
REVOKE SELECT ON github.repository FROM vinicius;

-- Revoke EXECUTE on a procedure
REVOKE EXECUTE ON github.sp_repos_linguagem FROM vinicius;
