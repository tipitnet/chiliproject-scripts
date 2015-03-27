#!/bin/bash

set -e

INSTANCE_NAME="$1"
TARGET_BRANCH="$2"

cd /var/www
git clone https://github.com/tipitnet/chiliproject $INSTANCE_NAME
cd $INSTANCE_NAME
git checkout $TARGET_BRANCH
git submodule init
git submodule update
mkdir files
mkdir log
mkdir -p tmp public/plugin_assets
touch log/received_emails.log
sudo chown -R nginx:app_writers files log tmp public/plugin_assets
sudo chmod -R 775 files log tmp public/plugin_assets

bundle install --without development
bundle exec rake generate_session_store
bundle exec rake db:migrate
bundle exec rake redmine:load_default_data
bundle exec rake db:migrate:plugins
