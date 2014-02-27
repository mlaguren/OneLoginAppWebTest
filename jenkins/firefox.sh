#!/bin/bash -xl
bundle install --path vendor/bundle

bundle exec cucumber -p staging --tags @firefox_box
