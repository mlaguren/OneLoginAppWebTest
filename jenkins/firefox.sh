#!/bin/bash -xl

export DISPLAY=:10
bundle install --path vendor/bundle

bundle exec cucumber -p staging --format json -o cucumber.json --tags @firefox_box
