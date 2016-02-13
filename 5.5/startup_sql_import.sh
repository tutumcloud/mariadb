ImportSql ()
{
  for FILE in ${STARTUP_SQL}; do
      echo "=> Importing SQL file ${FILE}"
      if [ "$ON_CREATE_DB" ]; then
          mysql -uroot "$ON_CREATE_DB" < "${FILE}"
      else
          mysql -uroot < "${FILE}"
      fi
  done
}

# Import Startup SQL
if [ -n "${STARTUP_SQL}" ]; then
    if [ ! -f /sql_imported ]; then
        echo "=> Initializing DB with ${STARTUP_SQL}"
        ImportSql
        touch /sql_imported
    fi
fi
