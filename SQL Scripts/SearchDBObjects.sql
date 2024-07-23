
-- 
-- SQL to find objects based on text string.  Looks in SPs, Views, Functions, Triggers and Tables of the current database
--

DECLARE @strFind AS VARCHAR(MAX) = 'AppDatabase,ReportingDatabase'

SET NOCOUNT ON; 

-- Create a temp table to store search values
DECLARE @SearchValues as TABLE (SearchValue VARCHAR(MAX)) 

-- Split the comma-separated values and insert into the temp table
INSERT INTO @SearchValues (SearchValue)

-- for SQL versions that do support STRING_SPLIT
--SELECT ltrim(rtrim(value))
--FROM STRING_SPLIT(@strFind, ',')

-- for SQL versions that do not support STRING_SPLIT
SELECT ltrim(rtrim(Element))
FROM [Custom].[cfn_SplitList](@strFind, ',')

-- Using UNION ALL to combine results with object type
SELECT
	 DB_NAME() as DB_Searched
    ,t.Object_Type
    ,t.Schema_Name
    ,t.Object_Name
    ,sv.SearchValue AS Found_Value
FROM (
    SELECT 
        'Procedure' AS Object_Type,
        SCHEMA_NAME(schema_id) AS Schema_Name,
        OBJECT_NAME(OBJECT_ID) AS Object_Name,
        OBJECT_DEFINITION(OBJECT_ID) AS Object_Definition
    FROM sys.procedures

    UNION ALL

    SELECT 
        'View' AS Object_Type,
        SCHEMA_NAME(schema_id) AS Schema_Name,
        OBJECT_NAME(OBJECT_ID) AS Object_Name,
        OBJECT_DEFINITION(OBJECT_ID) AS Object_Definition
    FROM sys.views

    UNION ALL

    SELECT 
        'Function' AS Object_Type,
        ROUTINE_SCHEMA AS Schema_Name,
        ROUTINE_NAME AS Object_Name,
        ROUTINE_DEFINITION AS Object_Definition
    FROM INFORMATION_SCHEMA.ROUTINES
    WHERE ROUTINE_TYPE = 'FUNCTION'

    UNION ALL

	SELECT 
        'Trigger' AS Object_Type,
        OBJECT_SCHEMA_NAME(OBJECT_ID) AS Schema_Name,
        NAME AS Object_Name,
        OBJECT_DEFINITION(OBJECT_ID) AS Object_Definition
    FROM sys.triggers

	UNION ALL

    SELECT 
        'Table Column' AS Object_Type,
        SCHEMA_NAME(t.schema_id) AS Schema_Name,
        t.name AS Object_Name,
        c.name AS Object_Definition
    FROM sys.tables AS t
    INNER JOIN sys.columns c ON t.OBJECT_ID = c.OBJECT_ID
) t
INNER JOIN @SearchValues sv ON (
    (t.Object_Type = 'Procedure' AND t.Object_Definition LIKE '%' + sv.SearchValue + '%') OR
    (t.Object_Type = 'View' AND t.Object_Definition LIKE '%' + sv.SearchValue + '%') OR
    (t.Object_Type = 'Function' AND t.Object_Definition LIKE '%' + sv.SearchValue + '%') OR
	(t.Object_Type = 'Trigger' AND t.Object_Definition LIKE '%' + sv.SearchValue + '%') OR
    (t.Object_Type = 'Table Column' AND t.Object_Definition LIKE '%' + sv.SearchValue + '%')
)
ORDER BY 
    t.[Object_Type],
    t.[Schema_Name],
    t.[Object_Name]


