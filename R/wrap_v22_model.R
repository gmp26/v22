#' Wrap Predict v2.2 script in a web R call returning results in JSON
#' @name wrap_v22_model
#' @param age.start age at diagnosis between 25 and 85
#' @param screening Clinically detected = 0, screen detected = 1
#' @param size Tumour size mm between 0 and 500
#' @param grade Cancer grade 1,2 or 3
#' @param nodes Number of positive nodes 0 to 100. 0.5 is equivalent to 1 with micromets yes in the PREDICT UI
#' @param er ER+ = 1, ER- = 0
#' @param her2 HER2+ = 1, HER2- = 0, missing = 9
#' @param ki67 KI67+ = 1, KI67- = 0, missing = 9
#' @param generation Chemo generation 0, 2 or 3 only
#' @param horm Hormone therapy Yes = 1, no = 0
#' @param traz Trastuzumab therapy Yes = 1, no = 0
#' @param bis Bisphosphonate therapy Yes = 1, no = 0
#' @description Takes parameters (that ultimately derive from an OPENCPU POST), and calls the predict model with those parameters. It then prints the results in JSON format so they can be fetched and parsed reasonably easily by a cljs test runner.
#' @export wrap_v22_model
#' @keywords Predict
#' @examples wrap_v22_model(66,1,12,2,2,1,1,1,3,1,1,1) calls the function locally
#' @examples curl -d'66,1,12,2,2,1,1,1,3,1,1,1' http://localhost:5656/ocpu/library/v22/R/wrap_v22_model calls it remotely.
#' @seealso v22_model
#' @return JSON encoded results
#' wrap_v22_model
{
  wrap_v22_model <- function(age.start = 66,
                             screening = 1,
                             # change from screen due to clash with R global roxygenise
                             size = 12,
                             grade = 2,
                             nodes = 2,
                             er = 1,
                             her2 = 1,
                             ki67 = 1,
                             generation = 3,
                             horm = 1,
                             traz = 1,
                             bis = 1)
  #
  # print results in JSON for response
  #
  print(jsonlite::toJSON(
    digits = 14,
    v22_model(
      age.start,
      screening,
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
      # do not change these
      radio = 0,
      r.enabled = 0
  ))
  )
}
#wrap_v22_model(66,1,12,2,2,1,1,1,3,1,1,1)
