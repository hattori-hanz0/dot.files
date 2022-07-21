#!/usr/bin/env #!/bin/bash

## Skrypt dla OpenBSD wyświetlający dodatkową dokumentację dla zainstalowanych pakeitów.

. ~/.config/vars

PLIKI=$(ls /usr/local/share/doc/pkg-readmes/|fzf)
/opt/nvim/bin/nvim /usr/local/share/doc/pkg-readmes/$PLIKI
