#!/bin/bash -xl
Xvfb :1 -screen 0 1280x960x24 &
echo $DISPLAY
export DISPLAY=:1
echo $DISPLAY
bundle install --path vendor/bundle
bundle exec cucumber -p staging --format json -o cucumber.json --tags @firefox_box
