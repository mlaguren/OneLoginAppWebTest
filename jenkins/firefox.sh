#!/bin/bash -xl
echo $DISPLAY
pwd

# Clean Up Scenarios Folder

rm -rf scenarios

# Remove @sauce tag

find features/**/*.feature -type f -exec sed -i '/\@sauce/d' {} \;

bundle install --path vendor/bundle

bundle exec cucumber -p $1 --format pretty --format json -o cucumber.json --tags @firefox_box --tags ~@wip
#bundle exec parallel_cucumber features/app/ -o "-p staging --format pretty --format json -o cucumber.json --tags @firefox_box --tags ~@wip"
