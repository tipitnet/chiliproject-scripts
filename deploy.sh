TARGET_INSTANCE="$1"
TARGET_BRANCH="$2"

cd /var/www/$TARGET_INSTANCE
git fetch
git checkout $TARGET_BRANCH
git merge origin/$TARGET_BRANCH
bundle install
touch /var/www/$TARGET_INSTANCE/tmp/restart.txt


# copy .env file
#cp .env $TARGET_LOCATION
#cd $TARGET_LOCATION

# get latest code
#git pull origin deploy-spike
#source .env

# run migrations
#bundle exec rake db:migrate

# restart the app
#touch tmp/restart