# need a backup file
# docker cp  ${{ parameters.BackupFileName }} postgres_container:/${{ parameters.BackupFileName }}
# docker exec -i postgres_container pg_restore -h ${{ parameters.PostgreSQLServer }} -U ${{ parameters.PostgreSQLUser }} -d ${{ parameters.DatabaseName }} --clean --create ${{ parameters.BackupFileName }}

docker cp  postgres-backup.sql postgres_container:/postgres-backup.dump
docker exec -i postgres_container pg_restore -h localhost -U postgres -C -d test-database-1 postgres-backup.dump
