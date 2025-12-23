#!/bin/bash
set -ex

# Install bundler and dependencies
gem install bundler
bundle install --with test
