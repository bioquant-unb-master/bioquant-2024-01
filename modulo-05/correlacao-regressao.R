

####### Aula Regressão Linear (preparado por Vivian, Waira, e Pedro)

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
shapiro.test(x)
shapiro.test(y)

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
regr=lm(b~a)
regr

# Verificando a significância e a interação das variáveis.
summary(regr)
summary(aov(regr))

# Construindo a equação da reta
# ax+b, onde a= coeficiente angular, b= intercepto
# Para encontra-los podemos olhar a funcao acima ou usar a função
# coef.
coef(regr)
# y=0.811x+51.93

# Plotando os dados
plot(b~a)

# Colocando a reta de regressão
abline(regr)

# Adicione a formula da reta de regressao ao grafico
text(80,200,"y=0.811+51.93")

## Diagnóstico completo dos resíduos
par(mfrow=c(2,2))
plot(regr) 
#o que olhamos nos 4 plot, olha a vairancia dos reciduos, o 1 mostra a homocedasticidade.
#2. mostra a normalidade

# Valores estimados de acordo com o melhor ajuste
fitted(regr)
# Valores da diferença entre os valores estimados e observados
residuals(regr)
l=data.frame(a=400)
predict(regr,l,interval="confidence")

#EXERCICIO PESO TEMPERATURA MAMIFEROS
temperatura<-c(18.3,18.5,18.3,19,18.4,18.7,18.9,19.1,18.2,18)
peso<-c(7.3,7.4,7.3,6.9,7.2,6.9,6.8,6.5,7,7.4)
cor.test(temperatura, peso) #tem que ser primeiro x e depois y
plot(temperatura, peso)
#correlacao negativa forte!
reg<-lm(peso~temperatura) #aqui eh y~X!! ao contrario!
reg
abline(reg,cex= 6, col="forest green", lty=1, lwd= 3)
par(mfrow=c(2,2))
plot(reg)
newdata<-data.frame(temperatura=c(20,21,22))
newdata
predict(reg, newdata, interval="predict") #funcao de predicao 
#quanto maior a predicao maior valor de incerteza upr

#AGORA VOCES VAO FAZER OS SEGUINTES EXERCICIOS

#### Exercicio 1

# O professor Roberto Cavalcanti foi ao campo e coletou o comprimento do corpo de 5 aves 
#e tambem o comprimento das asas destes individuos. 
#Ele quer saber qual a relacao entre essas variaveis e quanto uma varia em funcao da outra.
# Ajude-o fazendo o teste estatistico adequado.
# Ao final faca um grafico.
asas = c(1.6, 1.5, 1.8, 1.3, 1.2 ,1.8, 1.5, 1.6, 1.7, 1.8, 1.4, 1.3, 1.8, 1.6, 1.7, 1.5, 1.5, 1.1, 2.0 ,1.7, 1.9, 1.6, 1.7, 1.6, 1.4, 1.5, 1.6, 1.5, 1.6, 1.7, 1.5, 1.6, 1.6, 1.3, 1.4, 1.5, 1.5, 1.4 ,1.6 ,1.5, 1.4 ,1.5, 1.8 ,1.1, 1.7, 1.4, 1.1, 1.7, 1.6, 1.4)
corpo = c(3.3, 1.8, 4.2, 3.3, 1.3, 1.3, 2.5, 2.3, 4.4, 3.6, 2.3, 2.8, 4.4, 2.1, 2.3, 2.2, 4.3, 4.0, 1.0, 3.4, 2.6, 3.0, 3.1, 3.1, 2.9, 2.6, 3.0, 3.2,3.8, 2.6, 2.0, 2.0, 3.4, 4.0, 2.5, 2.0, 2.2, 4.5, 2.7, 2.1, 3.1 ,3.8,2.6, 2.8, 3.3, 4.6, 2.8, 2.9, 2.3, 2.8)




### Exercicio 2

# Vamos analisar agora a media do  numero de mortes por queda de escada nos Estados unidos com o 
# numero de advogados na Georgia (EUA) entre os anos de 1999 e 2009. 

acidentes = c(1.421, 1.307, 1.462, 1.598, 1.588, 1.638, 1.690, 1.818, 1.917, 1.935, 1.960)
advogados =c(21.268, 21.362, 22.254, 23.134, 23.698, 24.367, 24.930, 25.632, 26.459, 27.227, 27.457)

#Existe uma correlacao entre esses
#dados? Se sim, Qual  a possibilidade de relacao entre eles (porque voces acham que houve  relacao)?
# Ao final facam um grafico.

