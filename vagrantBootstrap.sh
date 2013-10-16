#!/usr/bin/env bash

# need to get ruby 2, which is not on this base box.
# start by installing RVM (Ruby Version Manager)
echo ---------- installing RVM
curl -L https://get.rvm.io | bash -s stable --ruby

# make rvm usable
echo ---------- running rvm init script
source /usr/local/rvm/scripts/rvm

#install ruby 2, make it the default
echo ---------- use Ruby 2
rvm use 2.0.0 --default

# do the stuff that needs to be done for the rails app to run the first time
echo ---------- bundle install
cd /vagrant
bundle install

#ensure postgresql is set up properly
echo ---------- sudo su
sudo su
echo ---------- su postgres
su postgres
echo ---------- create pg users
createuser -s --username=postgres vagrant
createuser -s --username=postgres RailsTimeTracker

echo ---------- rake db tasks
rake db:create:all
rake db:migrate

echo ----------- all done! Run bundle exec rails server to start the app