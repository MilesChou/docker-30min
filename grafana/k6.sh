#!/usr/bin/env bash

docker-compose run --rm --no-deps k6 run -o experimental-prometheus-rw basic.js