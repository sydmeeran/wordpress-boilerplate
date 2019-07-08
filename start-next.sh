# grab the environment variables and export them
if [ -f .env ]
then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

cp -f .env app/.env
cp -f .env .${PROJECT_NAME}-docker-scripts/.env

# run the next app
cd app
yarn && yarn dev
