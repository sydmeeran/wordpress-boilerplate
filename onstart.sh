# grab the environment variables and export them
if [ -f .env ]
then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

cp .env content/.env
cp .env app/.env
cp .env docker-scripts/.env

cd content
composer install
cd ..
cd docker-scripts
sh run.sh

# run the next app
cd ..
cd app
yarn && yarn dev
