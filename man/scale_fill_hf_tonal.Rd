\name{scale_fill_hf_tonal}
\alias{scale_fill_hf_tonal}
\alias{scale_fill_hf_warm}
\alias{scale_fill_hf_diverging}
\title{Continuous ggplot2 fill scales for heatmaps}
\usage{
scale_fill_hf_tonal(
  ...,
  colours = c("grey_blue", "light_green", "mint", "green", "blue"),
  reverse = FALSE,
  values = NULL,
  na.value = "#F4F6F8"
)

scale_fill_hf_warm(
  ...,
  reverse = FALSE,
  values = NULL,
  na.value = "#F4F6F8"
)

scale_fill_hf_diverging(
  ...,
  low = "blue",
  mid = "grey_blue",
  high = "red",
  midpoint = 0,
  na.value = "#F4F6F8"
)
}
\arguments{
\item{...}{Additional arguments passed to the ggplot2 scale.}

\item{colours}{Character vector of profile colour names or HEX colours used
for the gradient.}

\item{reverse}{If \code{TRUE}, reverse the colour order.}

\item{values}{Optional numeric vector passed to
\code{ggplot2::scale_fill_gradientn()}.}

\item{na.value}{Colour for missing values.}

\item{low, mid, high}{Profile colour names or HEX colours for low, midpoint,
and high values.}

\item{midpoint}{Numeric midpoint for the diverging scale.}
}
\value{
A ggplot2 scale.
}
\description{
Continuous ggplot2 fill scales for heatmaps and other continuous fill
aesthetics where the profile colours should be used as a gradient.
\code{scale_fill_hf_warm()} uses a light tint of the profile yellow followed
by the official yellow, orange, red, and purple profile colours.
}
