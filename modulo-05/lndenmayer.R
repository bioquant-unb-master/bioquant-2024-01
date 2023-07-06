library(robustbase)
View(possumDiv)
View(possum.mat)

possum40 = as.data.frame(possum.mat)
possum40$a1 = possum40$`NW-NE`
possum40$a2 = possum40$`NW-SE`
possum40$a3 = possum40$`SE-SW`
possum40$a4 = possum40$`SW-NW`
reglog = glm(Diversity ~ Stags + BAcacia + Bark + factor(Stumps) + factor(a1) + factor(a2) + factor(a3) + factor(a4), data=possum40, family="poisson")
reglog = glm(Diversity ~ Stags + BAcacia + Bark + Stumps + a1 + a2 + a3 + a4, data=possum40, family="poisson")

summary(reglog)
