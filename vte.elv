# VTE terminal support based on https://gitlab.gnome.org/GNOME/vte/blob/master/src/vte.sh

use re

fn -vte-urlencode [string]{ put $string }

fn -vte-osc7 []{
  printf "\033]7;file://%s%s\007" $E:HOSTNAME (-vte-urlencode $pwd)
}

after-chdir = [[dir]{ -vte-osc7 } $@after-chdir]

-vte-osc7
