# need a backup file
# docker cp  ${{ parameters.BackupFileName }} postgres_container:/${{ parameters.BackupFileName }}
# docker exec -i postgres_container pg_restore -h ${{ parameters.PostgreSQLServer }} -U ${{ parameters.PostgreSQLUser }} -d ${{ parameters.DatabaseName }} --clean --create ${{ parameters.BackupFileName }}

docker cp  postgres-backup.dump postgres_container:/postgres-backup.dump
docker exec -i postgres_container pg_restore -U postgres -d postgres -Ft -C postgres-backup.dump

# delete database
docker exec -i postgres_container dropdb -U postgres test-database -f

