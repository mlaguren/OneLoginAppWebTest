#!/bin/bash -xl
echo $DISPLAY
pwd

rm -rf scenarios
find features/**/*.feature -type f -exec sed -i '/\@sauce/d' {} \;

bundle install --path vendor/bundle

bundle exec cucumber -p staging --format pretty --format json -o cucumber.json --tags @firefox_box
