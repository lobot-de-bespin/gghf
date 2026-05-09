#' ggplot2 theme for Norwegian Health Trust plots
#'
#' A restrained ggplot2 theme using the programme's main blue as the primary
#' text/accent colour and Calibri as the default family. The font is not bundled
#' with this package.
#'
#' @param base_size Base font size.
#' @param base_family Base font family. Defaults to `"Calibri"`.
#' @param title_family Title font family. Defaults to `base_family`.
#'
#' @return A ggplot2 theme.
#' @export
theme_hf <- function(
  base_size = 11,
  base_family = "Calibri",
  title_family = base_family
) {
  blue <- .hf_colours[["blue"]]
  grey_blue <- .hf_colours[["grey_blue"]]

  ggplot2::theme_minimal(base_size = base_size, base_family = base_family) +
    ggplot2::theme(
      plot.title = ggplot2::element_text(
        family = title_family,
        face = "bold",
        colour = blue,
        size = ggplot2::rel(1.25),
        margin = ggplot2::margin(b = 8)
      ),
      plot.subtitle = ggplot2::element_text(
        colour = blue,
        margin = ggplot2::margin(b = 12)
      ),
      plot.caption = ggplot2::element_text(
        colour = grDevices::adjustcolor(blue, alpha.f = 0.75),
        size = ggplot2::rel(0.85),
        hjust = 0
      ),
      axis.title = ggplot2::element_text(colour = blue, face = "bold"),
      axis.text = ggplot2::element_text(colour = "#1F2933"),
      panel.grid.major = ggplot2::element_line(
        colour = grDevices::adjustcolor(grey_blue, alpha.f = 0.55),
        linewidth = 0.35
      ),
      panel.grid.minor = ggplot2::element_blank(),
      legend.title = ggplot2::element_text(colour = blue, face = "bold"),
      legend.position = "bottom",
      strip.text = ggplot2::element_text(colour = blue, face = "bold"),
      plot.background = ggplot2::element_rect(
        fill = "white",
        colour = NA
      ),
      panel.background = ggplot2::element_rect(
        fill = "white",
        colour = NA
      )
    )
}
