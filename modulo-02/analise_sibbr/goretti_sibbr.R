library(tidyverse)

buriti <- 
  read_csv("C:/R_central/bioquant-2024-01/modulo-02/analise_sibbr/registros_mauritia_flexuosa/registros_mauritia_flexuosa.csv",
         na=c("", "NA"),
         col_types=cols_only(Institution="f",
                             year="d",
         )) |>
  mutate(sp="Mauritia flexuosa")

pequi <-  
  read_csv("C:/R_central/bioquant-2024-01/modulo-02/analise_sibbr/registros_caryocar_brasiliense/registros_caryocar_brasiliense.csv",
           na=c("", "NA"),
           col_types=cols_only(Institution="f",
                               year="d",
           )) |> 
  mutate(sp="Caryocar brasiliense")

dados <- 
  bind_rows(pequi, buriti)

dados |> 
  write_csv2("C:/R_central/bioquant-2024-01/modulo-02/analise_sibbr/banco_dados.csv")

pequi |> 
  count(Institution) |> 
  arrange(desc(n)) |>
  filter(!is.na(Institution)) |> 
  ggplot(aes(reorder(Institution,
                     desc(n)),
             n))+
  geom_col()+
  theme_classic()+
  theme(axis.text.x=element_text(angle=90,
                                 hjust=1,
                                 vjust=0,
                                 size=6))+
  scale_y_continuous(breaks=c(seq(0,
                                  119,
                                  30),
                              119))+
  labs(x="Instituição",
       y="Registros")

buriti |> 
  count(Institution) |> 
  arrange(desc(n)) |>
  filter(!is.na(Institution)) |> 
  ggplot(aes(reorder(Institution,
                     desc(n)),
             n))+
  geom_col()+
  theme_classic()+
  theme(axis.text.x=element_text(angle=90,
                                 hjust=1,
                                 vjust=0,
                                 size=6))+
  scale_y_continuous(breaks=c(seq(0,
                                  12,
                                  4),
                              12))+
  labs(x="Instituição",
       y="Registros")
