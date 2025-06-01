-- INSERT: Adds new rows to a table

-- Complete example:
INSERT INTO github.repository (
    tiny, small, normal, big, precise, approximate, real_number,
    char_col, var, nvarchar_col, text_col,
    date_col, time_col, datetime_col, datetime2_col, smalldate_col,
    bool_col, binary_col, varbinary_col, xml_col, unique_col,
    hierarchy_col, geo_col, geometry_col, variant_col,
    organization_id
)
VALUES (
    1, 100, 1000, 100000, 123.45, 123.45, 123.45,
    'abc', 'SQL', N'SQL Server', 'A sample text',
    '2025-05-31', '12:34:56', GETDATE(), SYSDATETIME(), GETDATE(),
    1, 0x12345678, 0x12345678, '<xml>data</xml>', NEWID(),
    NULL, NULL, NULL, CAST(1 AS SQL_VARIANT),
    1
);

-- Basic example:
INSERT INTO github.repository (var, organization_id)
VALUES ('Python', 1);
