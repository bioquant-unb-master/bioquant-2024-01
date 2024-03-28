library(tidyverse)

limits <- 
bind_rows(
  map_df(
    iris[1:4],
    ~max(.)
  ),
  map_df(
    iris[1:4],
    ~min(.)
  )
) |> 
  `rownames<-`(c("max","min"))
