library(tidyverse)

iris <- tibble(iris)
iris |> View()

library(ggokabeito)

#comprimento por largura petala
disp_pt <- 
iris |> 
  ggplot(
    aes(
      Petal.Width,
      Petal.Length,
      color=Species
    )
  )+
  geom_point()+
  theme_classic()+
  scale_color_okabe_ito()+
  labs(
    x="Largura da Pétala",
    y="Comprimento da Pétala",
    color="Espécie"
  )+
  scale_y_continuous(
    breaks=c(
      6.9,
      seq(
        1.0,
        6.0,
        2
      )
    )
  )+
  scale_x_continuous(
    breaks=
      c(
        seq(
          0.0,
          2.5,
          1
        ),
        2.5
      )
  )

#comprimento por largura sepala
disp_sp <- 
iris |> 
  ggplot(
    aes(
      Sepal.Width,
      Sepal.Length,
      color=Species
    )
  )+
  geom_point()+
  theme_classic()+
  scale_color_okabe_ito()+
  labs(
    x="Largura da Sépala",
    y="Comprimento da Sépala",
    color="Espécie"
  )+
  scale_y_continuous(
    breaks=c(
      seq(
        4.3,
        7.9,
        2
      ),
      7.9
    )
  )+
  scale_x_continuous(
    breaks=
      c(
        seq(
          2.0,
          4.4,
          1
        ),
        4.4
      )
  )

#boxplot comprimento sepala
box_comp <- 
iris |> 
  ggplot(
    aes(
      Species,
      Sepal.Length,
      fill=Species
    )
  )+
  geom_violin(
    show.legend=F
  )+
  geom_boxplot(
    width=.2,
    show.legend=F
  )+
  theme_classic()+
  scale_fill_okabe_ito()+
  labs(
    x="Espécie",
    y="Comprimento da Sépala"
  )+
  scale_y_continuous(
    breaks=c(
      seq(
        4.3,
        7.9,
        2
      ),
      7.9
    )
  )

#boxplot largura sepala
box_larg <- 
iris |> 
  ggplot(
    aes(
      Species,
      Sepal.Width,
      fill=Species
    )
  )+
  geom_violin(
    show.legend=F
  )+
  geom_boxplot(
    width=.2,
    show.legend=F
  )+
  theme_classic()+
  scale_fill_okabe_ito()+
  labs(
    x="Espécie",
    y="Largura da Sépala"
  )+
  scale_y_continuous(
    breaks=
      c(
        seq(
          2.0,
          4.4,
          1
        ),
        4.4
      )
  )

library(cowplot)
boxes <- 
plot_grid(
  box_comp,
  box_larg,
  labels=letters
)