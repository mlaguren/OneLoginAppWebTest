#!/bin/bash -xl
bundle install --path vendor/bundle

if [ -z "$1" ]
then
  bundle exec cucumber SUITENAME="Local Test" BROWSER="Internet Explorer" OS="Windows 7" -p production features/app/API.feature:9
else
  if [ -z "$4" ]
  then
    bundle exec cucumber SUITENAME="$1" BROWSER="$2" OS="$3" -p production --format json -o cucumber.json -f pretty --tags @sauce features/app
  else
    bundle exec cucumber SUITENAME="$1" BROWSER="$2" OS="$3" VERSION="$4" -p production --format json -o cucumber.json -f pretty --tags @sauce features/app
  fi
fi
