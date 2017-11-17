#!/bin/sh


rake db:create
rake db:migrate
rake assets:precompile

#sidekiq -C config/sidekiq-web.yml -d
puma -C config/puma-web.rb