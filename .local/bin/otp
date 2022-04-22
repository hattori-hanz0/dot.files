#!/usr/bin/env bash

oathtool --base32 --totp "$(gopass "otp/$(find ~/.local/share/gopass/stores/root/otp/* -exec basename {} .gpg \; | fzf)")"
