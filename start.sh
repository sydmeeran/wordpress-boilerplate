# grab the environment variables and export them
if [ -f .env ]
then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

echo "running start-wordpress.sh";
sh start-wordpress.sh

echo "running start-next.sh";
sh start-next.sh
