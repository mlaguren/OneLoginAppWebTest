#!/bin/bash -xl
bundle install --path vendor/bundle
bundle exec cucumber SUITENAME="$1" BROWSER="$2" OS="$3" --format json -o cucumber.json --format junit -o sauce --tags @sauce features/app
