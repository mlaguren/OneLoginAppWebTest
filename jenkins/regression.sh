#!/bin/bash -xl
bundle install --path vendor/bundle

if [ -z "$1" ]
then
  bundle exec cucumber SUITENAME="Local Test" BROWSER="Internet Explorer" OS="Windows 7" -p staging features/app/*.feature
else
  if [ -z "$4" ]
  then
    bundle exec cucumber SUITENAME="$1" BROWSER="$2" OS="$3" -p staging --format json -o cucumber.json --tags @sauce features/app
  else
    bundle exec cucumber SUITENAME="$1" BROWSER="$2" OS="$3" VERSION="$4" -p staging --format json -o cucumber.json --tags @sauce features/app
  fi
fi
