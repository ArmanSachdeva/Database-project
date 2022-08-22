@echo off 
C:\xampp\mysql\bin\mysqldump --add-drop-database -u root -p --databases music_store_db > "music_store_db_backup.sql"
echo Done!
pause
exit