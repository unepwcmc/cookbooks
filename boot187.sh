#!/bin/sh
set -e -x
# BOOT SCRIPT BASED ON:
# Chef-solo bootstrap script for Ubuntu Lucid 10.04 (ami-714ba518)
# S. Tokumine 2010
# https://github.com/tokumine/gis-cookbooks/blob/master/boot.sh
#
# AND NOW ADAPTED TO DO:
# Chef-solo bootstrap script for Ubuntu Lucid 10.04 on Brightbox
# Setting up Ruby 1.9.2 Web+App Server
# S. Belchior 2011
#
# Run using the AWS EC2 API tools:
#  
# DB
# ec2-run-instances --block-device-mapping /dev/sda1=:150 ami-6c06f305 -f boot.sh -k ppekey -g default -g ppeutility -z us-east-1a -m -t c1.medium
#
# WEB
# ec2-run-instances --block-device-mapping /dev/sda1=:80 ami-6006f309 -f boot.sh -k ppekey -g default -g ppeutility -z us-east-1a -m -t m2.xlarge
#
# UTIL
# ec2-run-instances --block-device-mapping /dev/sda1=:80 ami-6c06f305 -f boot.sh -k ppekey -g default -g ppeutility -z us-east-1a -m -t c1.medium
#

# update apt
aptitude -y update
aptitude -y safe-upgrade

# install basic packages
apt-get -y install wget htop git-core checkinstall gcc g++ build-essential libssl-dev libreadline5-dev zlib1g-dev linux-headers-generic libpq-dev python-software-properties

# add repository for postgres9
add-apt-repository ppa:pitti/postgresql
add-apt-repository ppa:ubuntugis/ubuntugis-unstable
apt-get update

# install bundler
gem install bundler --no-rdoc --no-ri

# install chef
gem sources -a http://gems.opscode.com
gem install ohai --no-rdoc --no-ri
gem install chef --no-rdoc --no-ri
  
# clone unepwcmc chef repo
cd /tmp
git clone http://github.com/unepwcmc/cookbooks.git
cd /tmp/cookbooks

# kick off various different server configs depending on the server
# replace .json with the type of server you want to make
#
# database.json 		- configure as a postGIS 1.4 box
# web.json					- configure as a nginx+REE box
# utility.json			- configure sphinx
# starspan.json			- configure starspan
# full_stack.json   - database.json + web.json + utility.json
# ort_fullstack.json - database_nogis.json + web.json + utility.json
#
/usr/local/ruby/bin/chef-solo -c config/solo.rb -j server/database_nogis.json >> /var/log/chef.log
