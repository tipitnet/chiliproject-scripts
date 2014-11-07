#!/bin/bash

set -e

TARGET_INSTANCE="$1"
TARGET_BRANCH="$2"

mv $TARGET_INSTANCE/.env /var/www/$TARGET_INSTANCE
cd /var/www/$TARGET_INSTANCE
git fetch
git checkout $TARGET_BRANCH
git merge origin/$TARGET_BRANCH
RAILS_ENV=production bundle install --deployment
source ./.env
echo $MYSQL_ADDRESS
cat ./.env
RAILS_ENV=production bundle exec rake db:migrate
RAILS_ENV=production bundle exec rake db:migrate:plugins
touch ./tmp/restart.txt

