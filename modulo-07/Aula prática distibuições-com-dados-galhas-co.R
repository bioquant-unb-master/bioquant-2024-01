# Distribuicao e comparacao de amostras

# 1. Distribuicoes

# Compreender as populacoes e comunidades ? complexo, por isso, 
# estudamos amostras de cada uma delas. 
# Eventos biologicos apresentam certo grau de incerteza. 
# Probabilidade esta associada a quantificacao da incerteza!
# A m?dia dos resultados obtidos nos fornece a probabilidade.
# Porem, os eventos sao aleatorios e nao podemos medir com precissao 

# Tipos de vari?veis aleatorias: 
# Variaveis discretas: valores finitos (1,2,3)
# Variaveis continuas: qualquer valor num intervalo (1.3,1.4,1.5)

# Com o acumulo de dados, podemos observar diversos padroes 
# na distribuicao das frequencias!

# Distribucao define uma curva (grafico) e sua area sob a 
# curva que determina a probabilidade de ocorrer o evento 
# associado a mesma. (CPAQV, 2012)
# Importante: A area sob a curva e sempre 1!

# 1.1. Distribuicao normal (Gaussiana) ----

# As variaveis sao aleatorias porque tem algum componente que varia ao acaso.
# Ex: Peso de criancas que nascem de m?es que tiveram o mesmo tratamento na 
# gestacao. A frequencia de peso tera uma tendencia central
# 68% dos valores no meio da curva (Intervalo de confianca)
# Descrita pela m?dia, desvio padrao e variancia!
# rnorm(n=numero de obs, mean = 0, sd = 1)

# Ex 1. Simulacao de uma amostra com a media de visita por beija-flor em 
# 200 plantas
amostra <- rnorm(100, mean = 50, sd = 25)
amostra
summary(amostra)
plot(amostra, xlab = "Numero de observacoes", ylab = "M?dia da amostra")

# Grafico de sino
# com o comando dnorm() organizamos a amostra criada por densidade da frequencia
amostra2 <- rnorm(100)
plot(amostra2)
densidade <- dnorm(amostra2)
plot(amostra2, densidade)

# 1.2 Distribuicao uniforme ----

# Var?ncia menor que a media 
# Todos os valores dentro de um intervalo podem ocorrem com a mesma probabilidade
# Ex. Territorialismo. 
# runif(n=numero de obs, min = 0, max = 1), na qual min e max ? o intervalo

# Simulacao de 300 moscas femeas com o intervalo de 50 a 200 ovos por dia
unif <- runif(300, min=50, max=200)
summary(unif)
plot(unif)
densidade2 <- dunif(unif)
plot(unif, densidade2)

# 1.3 Distrinuicao binomial ----

# Agregada
# vari?ncia maior que a m?dia
# Variaveis aleatorias de Bernoulli: Aceita o sucesso ou fracasso (1 ou 0)
# Sistema de probabilidade discreta. 
# Grafico com o numero de sucessos da tentativa de Bernoulli.
# Ex. Presenca ou ausencia de especies num corrego. 
# rbinom(n=numero de obs, size=numero de tentativas, prob=probabilidade de 
# sucesso em cada tentativa)

# Simulacao de sucesso de cultivo de cepas de E. coli no laboratorio. 
# Vamos retirar 10 individuos de E. coli por tentativa.
coli <- rbinom(100, size = 200, prob = 0.7)
summary(coli)
plot(coli)
densidade3 <- dbinom(coli, size = 200, prob = 0.7)
plot(coli, densidade3)

# 1.4 Distribui??o Poisson ---

# Tamb?m chamada de distribui??o aleat?ria

## Um pesquisador observou a quantidade de larvas de besouro presente em 
#folhas de uma planta nativa do cerrado, a fim de descobrir a distribui??o 
#desses indiv?duos para prosseguir sua pesquisa

# dpois(x, lambda, op??es)
pois <- rpois(1:18, lambda = mean(1:18))
densidade4 <- dpois(1:18, lambda = mean(1:18))
plot(pois)
plot(pois, densidade4)

# 1.5. Comparando distribuicoes observadas e esperadas

obs=c(3,12,17,13,9,3,3)
den=density(obs)
plot(den)
plot(obs)

#Para verificar se nossos dados se adequam a uma distribui??o de poisson, primeiro vamos
#baixar o pacote vcd.
install.packages("vcd")
library(vcd)
?goodfit

#Agora, usamos a fun??o goodfit
gf=goodfit(obs,type = "poisson",method = "MinChisq")
gf

#Para sabermos o resultado, usamos a fun??o summary
summary(gf)
#Observamos o p-valor para concluir sobre a significancia do teste
rpois(obs, lambda = mean(obs))
obs

# 2. Exercicio

  #2.1. Importar os dados de campo

folhas <- c(1,0,10,1,14,45,14,0,6,2,20,42,2,7,5,14,20,7,15,
            9,21,12,0,10,4,2,4,1,4,22,18,9,5,3,5,3,2,4,1,3,
            1,9,20,13,11,0,23,32,0,4)

length(folhas)

  #2.2. Realizar analises exploratorias
  #(media, variancia, desvio padrao)
mean(folhas) # media
var(folhas) # variancia 
sd(folhas) # desvio padrao

 
  #2.3. Comparar distribuicoes (observada e esperada)  

ps <- rpois(folhas, lambda = mean(folhas))
plot(ps)
plot(folhas)
gf2 <- goodfit(folhas,type = "poisson",method = "MinChisq")
summary(g