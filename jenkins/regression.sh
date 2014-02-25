#!/bin/bash -xl
bundle install --path vendor/bundle
if [ -z "$4" ]
then
  bundle exec cucumber SUITENAME="$1" BROWSER="$2" OS="$3" -p staging --format json -o cucumber.json --format junit -o sauce --tags @sauce features/app
else
  bundle exec cucumber SUITENAME="$1" BROWSER="$2" OS="$3" VERSION="$4" -p staging --format json -o cucumber.json --format junit -o sauce --tags @sauce features/app
fi
