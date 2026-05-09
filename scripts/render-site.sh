#!/usr/bin/env bash
set -euo pipefail

quarto render .

# Quarto/revealjs uses data-src for lazy-loaded images. GitHub Pages serves the
# files correctly, but plain src makes the showcase robust in stricter browsers
# and in-app web views.
perl -0pi -e 's/<img data-src=/<img src=/g' docs/index.html
