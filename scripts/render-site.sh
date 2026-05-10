#!/usr/bin/env bash
set -euo pipefail

quarto render .

# Quarto/revealjs uses data-src for lazy-loaded images. Plain src makes the
# showcase robust in stricter browsers and in-app web views. Quarto may place
# attributes before data-src, especially when resources are embedded.
perl -0pi -e 's/(<img\b(?:(?!\bsrc=)[^>])*)\bdata-src=/$1src=/g' docs/index.html
