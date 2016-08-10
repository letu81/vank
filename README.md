rvm use 2.3.0
bundle install
bundle exec rake db:create
bundle exec rake db:reset
bundle exec rails s