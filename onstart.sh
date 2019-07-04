# grab the environment variables and export them
if [ -f .env ]
then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi


if [ -d "docker-scripts" ]
then

cp -r docker-scripts ${PROJECT_NAME}-docker-scripts

fi

cp .env content/.env
cp .env ${PROJECT_NAME}-docker-scripts/.env

cd content
composer install
cd ..
cd ${PROJECT_NAME}-docker-scripts
sh run.sh

# update the wordpress.sql file to the domain set in the .env file
