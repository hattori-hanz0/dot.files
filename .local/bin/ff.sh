#!/usr/bin/env bash

[ $# -eq 0 ] && echo "Podaj kolumnę do wyświetlenia." && exit

awk "{ print \$$1 }"
