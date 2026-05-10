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

.hf_resolve_colours <- function(colours) {
  palette_names <- names(.hf_colours)
  is_named_colour <- colours %in% palette_names
  resolved <- colours
  resolved[is_named_colour] <- .hf_colours[colours[is_named_colour]]
  valid <- vapply(
    resolved,
    function(colour) {
      !inherits(try(grDevices::col2rgb(colour), silent = TRUE), "try-error")
    },
    logical(1)
  )
  if (any(!valid)) {
    stop(
      "Unknown colour name(s) or invalid colour(s): ",
      paste(colours[!valid], collapse = ", "),
      call. = FALSE
    )
  }
  resolved
}

.hf_tint_colour <- function(colour, amount = 0.65) {
  rgb <- grDevices::col2rgb(.hf_resolve_colours(colour))[, 1]
  tinted <- round(rgb + (255 - rgb) * amount)
  grDevices::rgb(tinted[1], tinted[2], tinted[3], maxColorValue = 255)
}

.hf_warm_heat_colours <- function() {
  c(
    .hf_tint_colour("yellow"),
    unname(.hf_resolve_colours(c("yellow", "orange", "red", "purple")))
  )
}

#' Continuous ggplot2 fill scales for heatmaps
#'
#' These scales are intended for heatmaps and other continuous fill aesthetics
#' where the profile colours should be used as a gradient.
#'
#' @param ... Additional arguments passed to the ggplot2 scale.
#' @param colours Character vector of profile colour names or HEX colours used
#'   for the gradient.
#' @param reverse If `TRUE`, reverse the colour order.
#' @param values Optional numeric vector passed to
#'   [ggplot2::scale_fill_gradientn()].
#' @param na.value Colour for missing values.
#'
#' @return A ggplot2 scale.
#' @export
scale_fill_hf_tonal <- function(
  ...,
  colours = c("grey_blue", "light_green", "mint", "green", "blue"),
  reverse = FALSE,
  values = NULL,
  na.value = "#F4F6F8"
) {
  resolved <- .hf_resolve_colours(colours)
  if (reverse) {
    resolved <- rev(resolved)
  }

  ggplot2::scale_fill_gradientn(
    colours = resolved,
    values = values,
    na.value = na.value,
    ...
  )
}

#' @rdname scale_fill_hf_tonal
#'
#' @export
scale_fill_hf_warm <- function(
  ...,
  reverse = FALSE,
  values = NULL,
  na.value = "#F4F6F8"
) {
  resolved <- .hf_warm_heat_colours()
  if (reverse) {
    resolved <- rev(resolved)
  }

  ggplot2::scale_fill_gradientn(
    colours = resolved,
    values = values,
    na.value = na.value,
    ...
  )
}

#' @rdname scale_fill_hf_tonal
#'
#' @param low,mid,high Profile colour names or HEX colours for low, midpoint,
#'   and high values.
#' @param midpoint Numeric midpoint for the diverging scale.
#'
#' @export
scale_fill_hf_diverging <- function(
  ...,
  low = "blue",
  mid = "grey_blue",
  high = "red",
  midpoint = 0,
  na.value = "#F4F6F8"
) {
  ggplot2::scale_fill_gradient2(
    low = .hf_resolve_colours(low),
    mid = .hf_resolve_colours(mid),
    high = .hf_resolve_colours(high),
    midpoint = midpoint,
    na.value = na.value,
    ...
  )
}
