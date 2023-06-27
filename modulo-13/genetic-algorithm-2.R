library(genalg)
library(ggplot2)

dataset <- data.frame(item = c("pocketknife", "beans", "potatoes", "unions", 
                               "sleeping bag", "rope", "compass"), survivalpoints = c(10, 20, 15, 2, 30, 
                                                                                      10, 30), weight = c(1, 5, 10, 1, 7, 5, 1))
weightlimit <- 20

dataset
##           item survivalpoints weight
## 1  pocketknife             10      1
## 2        beans             20      5
## 3     potatoes             15     10
## 4       unions              2      1
## 5 sleeping bag             30      7
## 6         rope             10      5
## 7      compass             30      1

chromosome = c(1, 0, 0, 1, 1, 0, 0)
dataset[chromosome == 1, ]
##           item survivalpoints weight
## 1  pocketknife             10      1
## 4       unions              2      1
## 5 sleeping bag             30      7
cat(chromosome %*% dataset$survivalpoints)
## 42

evalFunc <- function(x) {
  current_solution_survivalpoints <- x %*% dataset$survivalpoints
  current_solution_weight <- x %*% dataset$weight
  
  if (current_solution_weight > weightlimit) 
    return(0) else return(-current_solution_survivalpoints)
}

iter = 100
GAmodel <- rbga.bin(size = 7, popSize = 200, iters = iter, mutationChance = 0.01,  elitism = T, evalFunc = evalFunc)
plot(GAmodel)
plot(GAmodel,type = "hist")

solution = c(1, 1,0, 1, 1, 1, 1)
dataset[solution == 1, ]
##           item survivalpoints weight
## 1  pocketknife             10      1
## 2        beans             20      5
## 4       unions              2      1
## 5 sleeping bag             30      7
## 6         rope             10      5
## 7      compass             30      1

cat(paste(solution %*% dataset$survivalpoints, "/", sum(dataset$survivalpoints)))

## 102 / 117
