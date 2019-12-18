#' Accepts model inputs in form required by PP's R script.
#' It then sources that script, creating the result variables.
#' Each result is converted to a dataframe, and then  inserted by name
#' into a list.
#' Finally, the list is converted to JSON and printed.
#' 
#' @param love Do you love cats? Defaults to TRUE.
#' @keywords cats
#' @export
#' @examples v22_model(66,1,12,2,2,1,1,1,3,1,1,1,0) calls the function locally
#' @examples curl -d'66,1,12,2,2,1,1,1,3,1,1,1,0' http://localhost:5656/ocpu/library/v22/R/v22_model calls it remotely.
#' 
#' v22_model()

v22_model <- function(age.start = 66,
                      screen = 1,
                      size = 12,
                      grade = 2,
                      nodes = 2,
                      er = 1,
                      her2 = 1,
                      ki67 = 1,
                      generation = 3,
                      horm = 1,
                      traz = 1,
                      bis = 1,
                      r.enabled = 0)
{
  source("Predict22.R")
  print(jsonlite::toJSON(digits = 14,
                         list(
    inputs = data.frame(
      age.start,
      screen,
      size,
      grade,
      nodes,
      er,
      her2,
      ki67,
      generation,
      horm,
      traz,
      bis,
      r.enabled
    )
  )))
}
# v22_model(66,1,12,2,2,1,1,1,3,1,1,1,0)