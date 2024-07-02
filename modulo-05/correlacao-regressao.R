


# Two way ANOVa com interacao 
# Para analisar a interacao da especie com o local, utilizamos o 
# simbolo :
resultado3 <- aov(prod2 ~ fat2+local+fat2:local, data = frutos2)
summary(resultado3)


# Test post hoc - Teste de Tukey ----
# Observamos que ha variacao entre as medias, mas quais medias
# variam entre elas? Sera que todas sao diferentes ou nao?

posth <-TukeyHSD(resultado2)
posth
plot(posth)

# Quando a barra cruzar o zero no eixo x, significa que a diferenca
# entre esses grupos nao e significativo. 
# Se a diferencia for positiva, a media do primeiro fator e maior 
# que do segundo fator.

# Quais sao as medias que nao tem diferencias significativas?









# Teste Kruskal wallis ----

# Visto se tem diferenca ou nao, devemos verificar onde esta a diferenca
# Vamos usar um Tukey nao parametrico para o kruskal wallis
pairwise.wilcox.test(Planilha_galhas$N_galhas,Planilha_galhas$Planta)



####### Aula Regressão Linear

# Regressão Linear
# Quanto que a variável y varia em relação a variavel x
# Porém antes disso, vamos falar de:

## Correlação
# Se as variáveis estão correlacionadas, ou seja, o grau pelo qual duas 
# Variaveis tendem a mudar juntas.
# É dado pelo coeficiente de correlação "r"

## Pearson
# parametrico
# preferencialmente contínuas

# Spearman
# uando não existe normalidade e/ou nao existe relação linear

# Kendall
# se existe correlação entre duas variáveis ordinais,usando uma escala ou gradiente.
# É um método adequado quando amostras têm tamanhos reduzidos,


# Correlacao entre massa de peixes e comprimento dos otolitos
x <-c(6.6,6.9,7.3,7.5,8.2,8.3,9.1,9.2,9.4,10.2)
y <-c(86,92,71,74,185,85,201,283,255,222)
shapiro.test()

# Parece que há uma correlação positiva entre as duas variáveis e podemos testar se esta correlação e real ou 
# nao usando a função cor.test().
# Testamos a significância da relação
# A correlação é maior que 0? (two.sided)
plot(x,y)

cor.test(x,y,method="pearson",alternative="two.sided")






#### Regressão linear
# Note, que a pergunta não é se elas estão relacionadas, e sim como.
# EM BUSCA DA EQUAÇÃO DA RETA!!

#Um exemplo de regressão simples linear: dados sobre a massa de fertilizante (gm-2) aplicada (b) e a
#colheita de grama obtida (gm-2) para cada aplicação de fertilizante (a).
a=c(25,50,75,100,125,150,175,200,225,250)
b=c(84,80,90,154,148,169,206,244,212,248)


## Fazendo a regressão, ajustando o modelo linear
regressao=lm(b~a)
regressao

# Verificando a significância e a interação das variáveis.
summary(regressao)
summary(aov(regressao))

# Construindo a equação da reta
# ax+b, onde a= coeficiente angular, b= intercepto
# Para encontra-los podemos olhar a funcao acima ou usar a função
# coef.
coef(regressao)
# y=0.811x+51.93

# Plotando os dados
plot(b~a)

# Colocando a reta de regressão
abline(regressao)

# Adicione a formula da reta de regressao ao grafico
text(80,200,"y=0.811+51.93")

## Diagnóstico completo dos resíduos
par(mfrow=c(2,2))
plot(regressao)

# Valores estimados de acordo com o melhor ajuste
fitted(regressao)
# Valores da diferença entre os valores estimados e observados
residuals(regressao)
l=data.frame(a=400)
predict(regressao,l,interval="confidence")
