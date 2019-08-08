#!/usr/bin/env bash
set -ex
export DEBIAN_FRONTEND=noninteractive
export NOKOGIRI_USE_SYSTEM_LIBRARIES=true
apt-get update && apt-get install -y tzdata libmysqlclient-dev
gem install bundler -v 2.0.1
# install
bundle install --jobs=3 --retry=3
# before_script
bundle exec bin/setup
# script
rake
