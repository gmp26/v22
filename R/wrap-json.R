
# this should force 14 figures in result. but doesn't work with data.frame inside list :(
options(digits = 14);

# execute Paul Pharoah's script
source("~/.m2/repository/predict-r-model/predict-r-model/0.1.0/Predict-v2.1-2018-04-07.R");

# return only benefits2.1
print(jsonLite::toJSON(digits=14,
             list(benefits2.1 = data.frame(benefits2.1),
                  inputs = data.frame(age.start,
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
                                      r.enabled))))
