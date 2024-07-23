##
##  to script into a GitRepos repo folder for version review
##

#### TEST
# AppDatabase
powershell.exe -File "C:\Users\jeffh\OneDrive\Documents\GitRepos\devlane_database_example\GenerateSqlScripts_v2.ps1" "." "AppDatabase_Test" "AppDatabase" "C:\Users\jeffh\OneDrive\Documents\GitRepos\devlane_database_example\DB" true false true
# AppReportingDatabase
powershell.exe -File "C:\Users\jeffh\OneDrive\Documents\GitRepos\devlane_database_example\GenerateSqlScripts_v2.ps1" "." "AppReportingDatabase_Test" "AppReportingDatabase" "C:\Users\jeffh\OneDrive\Documents\GitRepos\devlane_database_example\DB" true false true

#### PROD
# AppDatabase
powershell.exe -File "C:\Users\jeffh\OneDrive\Documents\GitRepos\devlane_database_example\GenerateSqlScripts_v2.ps1" "." "AppDatabase_Prod" "AppDatabase" "C:\Users\jeffh\OneDrive\Documents\GitRepos\devlane_database_example\DB" true false true
# AppReportingDatabase
powershell.exe -File "C:\Users\jeffh\OneDrive\Documents\GitRepos\devlane_database_example\GenerateSqlScripts_v2.ps1" "." "AppReportingDatabase_Prod" "AppReportingDatabase" "C:\Users\jeffh\OneDrive\Documents\GitRepos\devlane_database_example\DB" true false true
