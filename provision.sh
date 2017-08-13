#!/bin/sh -e

PG_DIR="/etc/postgresql/9.6/main"
PG_CONF="$PG_DIR/postgresql.conf"
PG_HBA="$PG_DIR/pg_hba.conf"

#This follows steps outlined at http://docs.timescale.com/getting-started/installation?OS=linux&method=apt
echo Adding TimescaleDB Repository...
/usr/bin/add-apt-repository ppa:timescale/timescaledb-ppa
echo Updating APT...
sudo apt-get update
echo Installing TimescaleDB
sudo apt install timescaledb -y
echo Adding TimescaleDB to postgresql.conf...
sed -i "s/^#shared_preload_libraries.*$/shared_preload_libraries = 'timescaledb'/" "$PG_CONF"
echo Configuring PostgreSQL For Remote Access...
echo Editing postgresql.conf to change listen address to '*'...
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" "$PG_CONF"
echo Appending to pg_hba.conf to add password auth...
echo "host    all             all             all                     md5" >> "$PG_HBA"
echo Restarting PostgreSQL...
sudo service postgresql restart
#echo Adding superuser postgres... (Testing revealed postgres super user already exists)
#createuser postgres -s
echo Setting Password For postgres
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'password';"