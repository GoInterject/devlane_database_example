##
##  to script into a GitRepos repo folder for version review
##

#### TEST
# AppDatabase
powershell.exe -File "C:\Users\jeffh\OneDrive\Documents\GitRepos\devlane_database_example\GenerateSqlScripts_v2.ps1" "." "AppDatabase_Test" "AppDatabase" "C:\Users\jeffh\OneDrive\Documents\GitRepos\devlane_database_example\DB" true false true
# ReportingDatabase
powershell.exe -File "C:\Users\jeffh\OneDrive\Documents\GitRepos\devlane_database_example\GenerateSqlScripts_v2.ps1" "." "ReportingDatabase_Test" "ReportingDatabase" "C:\Users\jeffh\OneDrive\Documents\GitRepos\devlane_database_example\DB" true false true

#### PROD
# AppDatabase
powershell.exe -File "C:\Users\jeffh\OneDrive\Documents\GitRepos\devlane_database_example\GenerateSqlScripts_v2.ps1" "." "AppDatabase_Prod" "AppDatabase" "C:\Users\jeffh\OneDrive\Documents\GitRepos\devlane_database_example\DB" true false true
# ReportingDatabase
powershell.exe -File "C:\Users\jeffh\OneDrive\Documents\GitRepos\devlane_database_example\GenerateSqlScripts_v2.ps1" "." "ReportingDatabase_Prod" "ReportingDatabase" "C:\Users\jeffh\OneDrive\Documents\GitRepos\devlane_database_example\DB" true false true
