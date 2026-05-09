# gghf

`gghf` provides a small ggplot2 theme and colour scales aligned with
*Nasjonalt profilprogram for helseforetakene*.

The package is intentionally limited to plot styling primitives:

- `theme_hf()` for a clean ggplot2 theme
- `scale_colour_hf()` / `scale_color_hf()` for discrete colour scales
- `scale_fill_hf()` for discrete fill scales
- `hf_palette()` for direct access to official HEX colours

It does not include or recreate the protected prikkekors symbol, health trust
logos, or other trademarked sender marks.

## Installation

```r
pak::pak("lobot-de-bespin/gghf")
```

## Presentation

A short Quarto presentation is published with GitHub Pages:
<https://lobot-de-bespin.github.io/gghf/>

## Example

```r
library(ggplot2)
library(gghf)

ggplot(mtcars, aes(factor(cyl), mpg, fill = factor(cyl))) +
  geom_boxplot(width = 0.65) +
  scale_fill_hf(guide = "none") +
  labs(
    title = "Drivstofforbruk etter sylindere",
    subtitle = "Eksempelplott med helseforetakspalett",
    x = "Sylindere",
    y = "Miles per gallon",
    caption = "Kilde: mtcars"
  ) +
  theme_hf()
```

## Source

Colour values and design direction are based on *Nasjonalt profilprogram for
helseforetakene*, final 2022 version, PDF metadata last modified 2025-02-26.
