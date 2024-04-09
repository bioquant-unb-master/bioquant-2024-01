## Topicos em Zoologia 2 - 2/2018

# Analise de variancia - ANOVA

# Utilizamos esta analise para saber se existe diferencia entre fatores 
# Saber se a diferencia das medias sao reais ou casuais.
# Observamos a variancia dentro dos grupos para saber se existe diferencia
# entre os grupos

# Valor de F
# F = (Variabilidade do fator/V. resudual)/V. residual
# F = 1: As medias sao similares
# F > 1: As medias sao diferentes

# H0 = As populacoes estudadas sao iguais (m1 = m2 = m3 = m4)
# H1 = As populacoes estudadas sao diferentes

# Premissas
# 1. Interdependencia das amostras
# 2. Homocedasticidade (Variancias comparaveis ou variancias iguais)
# 3. Distribuicao normal (Teste parametrico)

# One way ANOVA ----
# Neste anova iremos comparar um unico fator. 
# Temos mais de duas amostras e queremos saber se existe diferencia real 
# entre as medias. 

# Ex 1. Contamos a quantidade de frutos em 4 individuos de de cinco
# especies de lenhosas do Cerrado. 

jatoba <- c(17, 11, 16, 12)
cagaita <- c(13, 18, 16, 17)
copaiba <- c(16, 16, 19, 21)
araticum <- c(15, 12, 15, 14)
baru <- c(17, 11, 16, 12)

# Existe diferencia real entre as medias das amostras? (p = 0.05)
# Criaremos uma tabela para fazer a analise
# Variaveis dependentes que sejam continuos e variaveis
# Variaveis independentes que sejam classes ou fatores

# Criando as variaveis dependentes
prod <- c(jatoba, cagaita, copaiba, araticum, baru)

# Criar as variaveis independentes
fat <- c(rep("jatoba", 4), rep("cagaita", 4), rep("copaiba", 4), 
         rep("araticum", 4), rep("baru", 4))

# data.frame
frutos <- data.frame(fat, prod)
View(frutos)

# Visualisemos nossos dados...
plot(prod ~ fat, data = frutos)

# Premissas
# 1. Normalidade
shapiro.test(jatoba)
shapiro.test(cagaita)
shapiro.test(copaiba)
shapiro.test(araticum)
shapiro.test(baru)

# 2. Homocedasticidade
# Usaremos o test de levene que calcula a homocedasticidade
# H0 = variancia entre os grupos igual
# levene.test(y = vetor numerico, group = fator dos dados)
install.packages("lawstat")
library(lawstat)
levene.test(frutos$prod, group = frutos$fat)

# 3. Independencia das amostras
# Contamos frutos de cada arvore, entao temos certeza que sao independentes!

# Finalmente a ANOVA one way!
# aov(formula = y variando em relacao a X, data = tabela)
resultado <- aov(prod ~ fat, data = frutos)
summary(resultado)

# Como interpretar? Olhar o valor de F e confirmar com o valor de p

# Two way ANOVA ----
# Neste caso, temos dois fatores
# Queremos saber se a producao de frutos difere entre as especies e 
# dentro de replicas em cerrados sensu stricto.

# variavel dependente
tingui <- c(16, 13, 19, 9, 15, 11, 22, 25, 17, 10, 11, 9, 13, 14, 21)
barbatimao <- c(18, 17, 21, 15, 13, 12, 14, 16, 12, 11, 8, 22, 7, 15, 10)
tamboril <- c(14, 12, 13, 7, 12, 9, 11, 14, 12, 5, 10, 8, 9, 4, 10)
ipe <- c(21, 20, 16, 15, 16, 21, 25, 17, 14, 22, 15, 21, 20, 23, 21)

prod2 <- c(tingui, barbatimao, tamboril, ipe)
prod2

# Variaveis independentes: Fatores
fat2 <- rep(c(rep("tingui", 15), rep("barbatimao",15), 
              rep("tamboril", 15), rep("ipe", 15)))
fat2

local <- rep(c(rep("grandesertao",5), rep("veadeiros",5), 
               rep("brasilia",5)),4)
local

# Tabela
frutos2 <- data.frame(fat2, local, prod2)
frutos2
par(mfrow = c(1,2))
plot(prod2 ~ fat2+local, data = frutos2)

  # 1. Normalidade
    # 1.1. Normalidade do fator especie


    # 1.2. Normalidade do fator local
# Neste caso, precisamos testar a normalidade com os dados de media de 
# producao em cada local, para isso criamos um comando com essa condicao:
# shapiro.test dos valores de quantidade quando o local seja igual a x. 

shapiro.test(frutos2[frutos2$local == "grandesertao",]$prod2)


  # 2. Homocedasticidade
#levene.test(variavel dependente, group = variavel independente)


# Two way ANOVA
# Neste caso, precisamos especificar que usaremos dois fatores
# Para analisar o fator especie e o fator local, utilizamos o simbolo +
# resultado2 <- aov(var dependente ~ fator1 + fator 2, data = tabela)

# Qual o resultado? A variacao na quantidade de frutos entre especies e/ou
# entre locais?


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
