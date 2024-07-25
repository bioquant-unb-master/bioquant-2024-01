#Script R para o exemplo dos transectos das baleias minke na Antartida
#
 library("Distance")
 data("minke")
head(minke)
#
#Fitting detection functions in R
#First we fit a model to the minke whale data, setting the truncation at 1.5km and using the default #options in ds very simply:
#
minke_hn <- ds(minke, truncation = 1.5)
#
#A different form for the detection function can be specified via the key= argument to ds. For #example, a hazard rate model can be fitted as:
#
minke_hrcos <- ds(minke, truncation = 1.5, key = "hr")
#
#Other adjustment series can be selected using the adjustment= argument and specific orders of #adjustments can be set using order=. For example, to specify a uniform model with cosine #adjustments of order 1 and 2 we can write:
#
minke_unifcos <- ds(minke, truncation = 1.5, key = "unif", adjustment = "cos", order = c(1, 2))
#
#Estimating abundance and variance in R
#Returning to the minke whale data, we have the necessary information to calculate A and a #above, so we can estimate abundance and its variance. When we supply data to ds in the #“flatfile” format given above, ds will automatically calculate abundance estimates based on the #survey information in the data. Having already fitted a model to the minke whale data, we can #see the results of the abundance estimation by viewing the model summary:
#
summary(minke_hn)
#