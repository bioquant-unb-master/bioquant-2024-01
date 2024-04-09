library(tidyverse)

elaenia <- 
read_csv2("C:/R_central/bioquant-2024-01/modulo-03/medidas_elaenia_opt.CSV",
          na=c("", "#N/D"),
          col_types=cols(especie = col_factor(),
                         sexoesp = col_factor(),
                         comptotbico = col_double(),
                         altbico = col_double(),
                         largbico = col_double(),
                         compasa = col_double(),
                         comptmet = col_double(),
                         compcauda = col_double(),
                         sexo1m2f3na = col_factor(),
                         compbico = col_double()))

