#!/bin/sh


echo $RAILS_ENV
echo $PASSENGER_APP_ENV
rake db:create
rake db:migrate

#sidekiq -C config/sidekiq-web.yml -d
puma -C config/puma-web.rb