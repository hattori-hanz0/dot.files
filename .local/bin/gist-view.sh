#!/usr/bin/env bash

gh gist list -L 1000 | fzf | cut -f 1 | xargs gh gist view
