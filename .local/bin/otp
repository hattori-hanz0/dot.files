#!/usr/bin/env bash

oathtool --base32 --totp "$(pass "otp/$(find ~/.password-store/otp/* -exec basename {} .gpg \; | fzf)")"
