#!/bin/bash -xl
ps -ef | grep X
echo $DISPLAY
export DISPLAY=:10
echo $DISPLAY
bundle install --path vendor/bundle

bundle exec cucumber -p staging --format json -o cucumber.json --tags @firefox_box
