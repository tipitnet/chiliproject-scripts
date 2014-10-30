# copy .env file
cp .env $TARGET_LOCATION
cd $TARGET_LOCATION

# get latest code
git pull origin deploy-spike
source .env

# run migrations
bundle exec rake db:migrate

# restart the app
touch tmp/restart