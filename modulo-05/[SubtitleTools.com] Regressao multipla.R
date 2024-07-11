
### Aula prática - Regressao Linear Multipla



# A Regressao Linear Multipla, assim como a Regressao Linear Simples, permite 
# descrever a relaçăo entre variáveis explicativas de um determinado processo.
# Nessa classe de modelos, é possível descrever a relaçăo entre duas ou mais 
# variáveis explicativas.

# Em casos de Regressăo Linear Multipla, a reta ajustada pode nao ser bem descrita 
# por apenas uma variável explicativa, sendo necessário considerar outras
# variáveis explicativas (independentes) que possam estar influenciando 
# a variável resposta (dependente).Assim, a Regressăo Linear Múltipla nada mais é
# do que uma generalizaçăo da Regressao Linear Simples.




#____________________________________________________________________________________________________

### Exemplo 1: Niveis de poluicao


dados <- read.table("Poluicao.txt", header=T)

polu <- dados$Poluicao; polu # variavel resposta
ind <- dados$Industria; ind
temp <- dados$Temp; temp
pluv <- dados$Pluviosidad; pluv
vento <- dados$Vento; vento


plot(polu ~ ind, data = dados) # visualizacao grafica das minhas variaveis duas a duas
plot(polu ~ temp, data = dados)
plot(polu ~ pluv, data = dados)
plot(polu ~ vento, data = dados)


# criando modelos

install.packages("lm.beta")
library(lm.beta)

summary(lm(polu ~ ind + pluv + temp)) # modelo 1: POLU ~ IND + PLUV + TEMP

summary(lm(polu ~ ind + temp)) # modelo 2: POLU ~ IND + TEMP

summary(lm(polu ~ ind + temp + pluv + vento)) # modelo 3: POLU ~ IND + TEMP + PLUV + VENTO



# verificando o quanto nosso modelo explica o processo em estudo (r2 e r2 ajustado),
# a partir dos resultados encontrados acima!

# Validando os pressupostos a partir dos RESIDUOS!

res1 <- rstandard(lm(polu ~ ind + pluv + temp)); res1 # residuos do modelo 1
res2 <- rstandard(lm(polu ~ ind + temp)); res2 # residuos do modelo 2
res3 <- rstandard(lm(polu ~ ind + temp + pluv + vento)); res3 # residuos do modelo 3


shapiro.test(res1) #teste de normalidade dos residuos
shapiro.test(res2)
shapiro.test(res3)

install.packages("car")
library(car)

?ncvTest # outra forma de se testar a homocedasticidade (homogeneidade) de variancias
ncvTest(lm(polu ~ ind + pluv + temp)) # teste de homogeneidade das variancias
ncvTest(lm(polu ~ ind + temp))
ncvTest(lm(polu ~ ind + temp + pluv + vento))


# Exercicio para casa: Com base no arquivo "Ambiental.txt" disponivel no Teams e o script da aula, 
# como apoio, respondam ao exercicio abaixo.


# Em um estudo, espera-se investigar a ocorrencia de uma determinada especie de peixe em regioes
# estuarias da Bahia. Dessa forma, consultores ambientais extrairam dados referentes a abundancia 
# de individuos da especie em cada uma das 30 localidades e tambem seu ph, condutividade e turbidez 
# da agua. Utilizando-se a analise apropriada, é possivel afirmar
# que tais variaveis independentes exercem influencia sobre a abundancia desses peixes nas localidades
# estudadas? Proponha um ou mais modelos que possam explicar processo em que estamos estudando. 
# É possivel concluir que a condutividade afeta a abundancia desses peixes nessas localidades?




