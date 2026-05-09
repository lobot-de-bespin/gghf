.hf_colours <- c(
  blue = "#003087",
  light_blue = "#6CACE4",
  grey_blue = "#BFCED6",
  green = "#6FA287",
  light_green = "#ADDFB3",
  mint = "#00C19F",
  lime = "#93C90E",
  yellow = "#FFC845",
  orange = "#FF671F",
  brown = "#A76E5E",
  red = "#CB333B",
  purple = "#87189D"
)

#' Norwegian Health Trust colour palette
#'
#' Returns colours from the national visual identity programme for Norwegian
#' health trusts. Values are the official web HEX values from the programme.
#'
#' @param names Optional colour names. If `NULL`, all colours are returned.
#'
#' @return A named character vector of HEX colours.
#' @export
hf_palette <- function(names = NULL) {
  if (is.null(names)) {
    return(.hf_colours)
  }

  unknown <- setdiff(names, names(.hf_colours))
  if (length(unknown) > 0) {
    stop(
      "Unknown colour name(s): ",
      paste(unknown, collapse = ", "),
      call. = FALSE
    )
  }

  .hf_colours[names]
}

.hf_discrete_palette <- function(reverse = FALSE) {
  colours <- unname(.hf_colours)
  if (reverse) {
    colours <- rev(colours)
  }
  scales::manual_pal(colours)
}

#' ggplot2 colour and fill scales for Norwegian Health Trust colours
#'
#' @param ... Additional arguments passed to the ggplot2 scale.
#' @param reverse If `TRUE`, reverse the default colour order.
#'
#' @return A ggplot2 scale.
#' @export
scale_colour_hf <- function(..., reverse = FALSE) {
  ggplot2::discrete_scale(
    aesthetics = "colour",
    scale_name = "hf",
    palette = .hf_discrete_palette(reverse = reverse),
    ...
  )
}

#' @rdname scale_colour_hf
#' @export
scale_color_hf <- scale_colour_hf

#' @rdname scale_colour_hf
#' @export
scale_fill_hf <- function(..., reverse = FALSE) {
  ggplot2::discrete_scale(
    aesthetics = "fill",
    scale_name = "hf",
    palette = .hf_discrete_palette(reverse = reverse),
    ...
  )
}
