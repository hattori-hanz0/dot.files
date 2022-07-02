#!/usr/bin/env bash

. ~/.config/vars

sk | xargs -r -I % $EDITOR %
