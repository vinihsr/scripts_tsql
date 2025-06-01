-- DENY: explicitly blocks a permission (overrides GRANT)

-- Deny DELETE permission
DENY DELETE ON github.repository TO vinicius;

-- Deny EXECUTE on all stored procedures
DENY EXECUTE TO vinicius;
