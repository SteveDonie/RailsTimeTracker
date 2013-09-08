#!/usr/bin/env bash

# need to get ruby 2, which is not on this base box.
# start by installing RVM (Ruby Version Manager)
curl -L https://get.rvm.io | bash -s stable --ruby

# make rvm usable
source /home/vagrant/.rvm/scripts/rvm

#install ruby 2, make it the default
rvm use 2.0.0 --default

# do the stuff that needs to be done for the rails app to run the first time
cd /vagrant
bundle install
