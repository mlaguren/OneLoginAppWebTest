#!/bin/bash -xl
bundle install --path vendor/bundle
bundle exec cucumber REGRESSION="$1" BROWSER="$2" --format json -o cucumber.json --tags @sauce features/app
