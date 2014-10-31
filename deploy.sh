echo $BUILD_NUMBER >> version.txt

cd /var/www/chiliproject-inviteme
git pull origin deploy-spike
bundle install
touch /var/www/chiliproject-inviteme/tmp/restart.txt


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