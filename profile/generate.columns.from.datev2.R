#' @include episem.R
NULL

#' Generate new columns epiyearweek, epiweek and epiyear from date column
#'
#' Function \code{generate.columns.from.date} creates new column from original one
#' written in the format YYYY-MM-DD, using Brazilian epidemiological week system
#'
#' @name generate.columns.from.date
#'
#' @param x String with date in the format YYYY-DD-MM or an object of class Date
#'
#' @return
#' \code{generate.columns.from.date} returns a named list with the values
#' epiweek, epiyear and epiyearweek
#' epiyearweek have the format 2009W42
#'
#' @examples
#' df <- data.frame(list(date=c('2009-08-01', '2009-09-01', '2009-10-01', '2010-01-01')))
#' t(sapply(df$date, generate.columns.from.date))
#'
#' @export
generate.columns.from.datev2 <- function(x){

  epiyearweek.val <- episem(x)
  epiyearweek.val.split <- strsplit(epiyearweek.val, 'W')
  epiyear.val <- as.integer(epiyearweek.val.split[[1]][1])
  epiweek.val <- as.integer(epiyearweek.val.split[[1]][2])

  return(list(epiweek=epiweek.val, epiyear=epiyear.val, epiyearweek=epiyearweek.val))
}
