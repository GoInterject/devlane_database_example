
--
--	Do Backup with Compression (Copy Only)
--

return

Declare @dbname varchar(200) = 'AppDatabase_Test'
Declare @FilePath varchar(1000) = 'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\Backup\'
Declare @FileNameSuffix varchar(100) = '20240721'

Declare @FileName varchar(300) =  @dbname + '_' + @FileNameSuffix + '.bak'

set @FilePath = @FilePath + '\' + @FileName

declare @Name as varchar(200)
set @Name =  @FileName + ' - Full Database Backup - Copy Only with Compression'

declare @Description as varchar(200)
set @Description =  'Full backup of '  +  @dbname + ' on ' + convert(varchar(50), getdate(),109)

backup database @dbname
TO 
	DISK = @FilePath
	WITH 
	NAME = @Name,
	DESCRIPTION = @Description,
	INIT,
	SKIP,
	STATS = 10,
	COPY_ONLY
	,Compression -- Only supported in later versions of SQL Server
	