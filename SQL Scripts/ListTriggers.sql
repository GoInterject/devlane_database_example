
--
-- LISTS ALL THE TRIGGERS IN THE DATABASE
--


-- Get all triggers in the current database
SELECT 
	 DB_NAME() as DB_Searched
    ,OBJECT_SCHEMA_NAME(OBJECT_ID) AS Schema_Name
    ,NAME AS Trigger_Name
    ,OBJECT_DEFINITION(OBJECT_ID) AS Trigger_Definition
FROM sys.triggers
ORDER BY 
    Schema_Name
    ,Trigger_Name
