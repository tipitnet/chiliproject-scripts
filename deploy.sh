#!/bin/bash

set -e

TARGET_INSTANCE="$1"
TARGET_BRANCH="$2"

mv $TARGET_INSTANCE/.env /var/www/$TARGET_INSTANCE
cd /var/www/$TARGET_INSTANCE
git fetch
git checkout $TARGET_BRANCH
git merge origin/$TARGET_BRANCH
bundle install
source ./.env
echo $MYSQL_ADDRESS
cat ./.env
bundle exec rake db:migrate
touch ./tmp/restart.txt

