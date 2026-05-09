# gghf

`gghf` provides a small ggplot2 theme and colour scales aligned with
*Nasjonalt profilprogram for helseforetakene*.

The package is intentionally limited to plot styling primitives:

- `theme_helse()` for a clean ggplot2 theme
- `scale_colour_helse()` / `scale_color_helse()` for discrete colour scales
- `scale_fill_helse()` for discrete fill scales
- `helse_palette()` for direct access to official HEX colours

It does not include or recreate the protected prikkekors symbol, health trust
logos, or other trademarked sender marks.

## Installation

```r
# Private repository while the package is under development:
# pak::pak("lobot-de-bespin/gghf")
```

## Example

```r
library(ggplot2)
library(gghf)

ggplot(mtcars, aes(factor(cyl), mpg, fill = factor(cyl))) +
  geom_boxplot(width = 0.65) +
  scale_fill_helse(guide = "none") +
  labs(
    title = "Drivstofforbruk etter sylindere",
    subtitle = "Eksempelplott med helseforetakspalett",
    x = "Sylindere",
    y = "Miles per gallon",
    caption = "Kilde: mtcars"
  ) +
  theme_helse()
```

## Source

Colour values and design direction are based on *Nasjonalt profilprogram for
helseforetakene*, final 2022 version, PDF metadata last modified 2025-02-26.
