#!/bin/bash

# Change to the Rails app directory
cd /app

# Install gems using Bundler
bundle install --without development test

# Precompile assets for production
bundle exec rake assets:precompile

# Migrate the database (if needed)
bundle exec rake db:migrate

# Restart the Rails server
touch tmp/restart.txt
