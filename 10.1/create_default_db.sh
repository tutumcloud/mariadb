if [ -n "$ON_CREATE_DB" ]; then
  echo "=> Creating database $ON_CREATE_DB"
  mysql -uroot -e "CREATE DATABASE IF NOT EXISTS $ON_CREATE_DB"
  echo "=> Database ${ON_CREATE_DB} created."
fi
