#!/bin/sh


rake db:create
rake db:migrate
rake db:seed
rake assets:precompile RAILS_ENV=production

#sidekiq -C config/sidekiq-web.yml -d
puma -C config/puma-web.rb