# grab the environment variables and export them
if [ -f .env ]
then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

echo "Gracefully stop all other containers from running"
docker stop $(docker ps -a -q)

if grep -q "${WP_WEB_DOMAIN}" /etc/hosts; then
    echo "A local record for ${WP_WEB_DOMAIN} already exists within your host file."
else
    sudo -- sh -c -e "echo '127.0.0.1 ${WP_WEB_DOMAIN}' >> /etc/hosts";### Flush host file cache
    sudo killall -HUP mDNSResponder
    echo "A local record for ${WP_WEB_DOMAIN} has been added to your host file."
fi

### Create Docker proxy network

docker network create nginx-proxy || true
cd nginx-proxy/
docker-compose build
docker-compose up -d nginx-proxy
sleep 5
cd ../

# check if database exists
# if not then create the database and run the initial script on it
# $EXISTS=$(mysqlshow ${PROJECT_NAME})

### Start Local Development Environment
docker-compose build
docker-compose up -d

#
# sleep 10

FILE=.my.cnf

/bin/cat <<EOM >$FILE
[client]
user=${DB_USER}
password=${DB_PASSWORD}
EOM

# now that we have a db up, lets intialise it

COUNT=0
SKIP=0

while ! mysql --defaults-file=.my.cnf ${DB_NAME} -h 127.0.0.1 --port=3324 -e "show tables;" ; do
    echo "Error connecting, sleeping for 5 seconds then retrying"

    if [ $COUNT -eq 10 ]
    then
        SKIP=1
        break;
    fi
    COUNT=$((COUNT + 1))
    sleep 5
done

if [ $SKIP -eq 0 ]
then
    DB=$(mysql --defaults-file=.my.cnf ${DB_NAME} -h 127.0.0.1 --port=3324 -e "show tables;" | wc -c);
fi

if [ $DB -eq 0 ]
then
  mysql --defaults-file=.my.cnf ${DB_NAME} -h 127.0.0.1 --port=3324 < startup/wordpress.sql
fi

echo "Running at: ${WP_WEB_SCHEME}://${WP_WEB_DOMAIN}:${WP_WEB_PORT}"
