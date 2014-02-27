#!/bin/bash -xl
ps -ef | grep X
echo $DISPLAY
export DISPLAY=:10
echo $DISPLAY
bundle install --path vendor/bundle
/etc/init.d/xvfb start
bundle exec cucumber -p staging --format json -o cucumber.json --tags @firefox_box
/etc/init.d/xvfb stop
