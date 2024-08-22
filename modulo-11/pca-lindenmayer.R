# Load data
library(robustbase)
data("possumDiv")
possumnew <- possumDiv [,-1]
possumnew <- possumnew [, -c(7:8)]
log.ir = possumnew
# log transform 

ir.species <- possumDiv[, 1]
ir.species <- as.character(ir.species)

# apply PCA - scale. = TRUE is highly 
# advisable, but default is FALSE. 
ir.pca <- prcomp(log.ir,
                 center = TRUE,
                 scale. = TRUE) 
# print method
print(ir.pca)
# plot method
plot(ir.pca, type = "l")
# summary method
summary(ir.pca)
# Predict PCs
predict(ir.pca, 
        newdata=tail(log.ir, 2))
# instalar pacote ggbiplot
library(devtools)
install.packages("ggbiplot")

library(ggbiplot)
g <- ggbiplot(ir.pca, obs.scale = 1, var.scale = 1, 
              groups = ir.species, ellipse = TRUE, 
              circle = TRUE)
g <- g + scale_color_discrete(name = '')
g <- g + theme(legend.direction = 'horizontal', 
               legend.position = 'top')
print(g)

