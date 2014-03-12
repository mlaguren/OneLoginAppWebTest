#!/bin/bash -xl
echo $DISPLAY
pwd

# Clean Up Scenarios Folder

rm -rf scenarios

# Remove @sauce tag

find features/**/*.feature -type f -exec sed -i '/\@sauce/d' {} \;

bundle install --path vendor/bundle

bundle exec cucumber -p shadow --format pretty --format json -o cucumber.json --tags @firefox_box
