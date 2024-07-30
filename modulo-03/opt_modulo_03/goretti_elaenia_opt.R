library(tidyverse)

elaenia <- 
read_csv2("C:/R_central/bioquant-2024-01/modulo-03/opt_modulo_03/medidas_elaenia_opt.CSV",
          na=c("", "#N/D", "NA"),
          col_types=cols(especie = col_factor(),
                         sexoesp = col_skip(),
                         comptotbico = col_double(),
                         altbico = col_double(),
                         largbico = col_double(),
                         compasa = col_double(),
                         comptmet = col_double(),
                         compcauda = col_double(),
                         sexo1m2f3na = col_factor(),
                         compbico = col_double()))

m_compasa <- 
  elaenia |> 
  filter(sexo1m2f3na!=3) |> 
  group_by(especie, sexo1m2f3na) |> 
  reframe(media=mean(compasa,
                     na.rm=T),
          icmin=mean(compasa,
                     na.rm=T)-sd(compasa,
                                   na.rm=T),
          icmax=mean(compasa,
                     na.rm=T)+sd(compasa,
                                   na.rm=T)) |> 
  group_by(especie) |> 
  group_split()

m_compasa[[6]] |> 
  ggplot(aes(sexo1m2f3na, media))+
  geom_point()+
  geom_errorbar(aes(ymin=icmin,
                    ymax=icmax))
