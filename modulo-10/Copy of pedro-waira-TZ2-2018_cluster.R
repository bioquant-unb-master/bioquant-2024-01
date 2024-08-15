## Topicos em Zoologia 2 - 2/2018
# Prof. Roberto Cavalcanti

# 1. Analise de agrupamento

## Como separar dados que aparentemente criam grupos?

# A analise de agrupamento ou cluster
# Analise multivariada que separa os dados em grupos homogeneos
# Particao da similaridade, ou seja, iremos separar pela 
# homogeneidade dentro dos grupos e a heterogeneidade entre os grupos. 

## Metodologia: 
# Realizaremos um estudo comparativo entre amostras
# Medidas de semelhanca: "Grandecas numericas que quantificam o grau 
# de associacao entre um par de objetos" (Valentin, 1995)

# 1. Escolha dos tipos de medidas: metricas e nao metricas ----
# Metricos: sao dados continuos
# Nao metricos ou binarios: dados de presenca e ausencia

# 2. Escolha do indice para criar matriz de similaridade/dissimilaridade ----

# Qual indice escolher? Depende dos seus dados!

## Similaridade e dissimilaridade

# Similaridade: semelhanca entre duas medidas
# Quanto maior a medida de similaridade, maior a semelhanca entre os
# individuos.

# Dissimilaridade: Distancia entre duas medidas.
# Quanto maior a medida de dissimilaridade, menor sera a semelhanca
# ente os grupos. 

# 1) Indice de dados binarios = Jaccard e Soresen 
# Jaccard: S1 = A/A+B+C 
# Soresen: S2 = 2A/2A+B+C <- Valoriza a presenca simultanea de 2 sp.
# (A = Sp comum as duas amostras, B = numero de sp que ocorre em uma
# amostra, C = numero de especies que ocorre na outra amostra)
# 0 = Nenhuma similaridade (Ausencia da sp na amostra)
# 1 = similaridade completa (presenca da sp em todas as amostras)

# Problema = Desconsidera a dupla-ausencia. Sera que nao apareceu nas duas 
# amostras pela coleta de dados ou existe razao ecologica? 

# 2) Coeficiente de distancia = Distancia Euclidiana
# Permite visualizar graficamente a proximidade entre duas amostras, 
# quanto menor a distancia entre dois pontos, mais similares
# Utiliza o teorema de Pitagoras
# D(a-b) = â(Xa1 - Xb1)2 + (Xa2 - Xb2)2
# D(a-b) = Hipotenusa entre as amostras a e b, em funcao da abundancia x de
# duas especies 1 e 2. 

# Problema = Aumento da medida pelo aumento de descritores, nao recomendada
# para amostras com abundancia.

# 3) Distancia de Bray-Curtis
# Compara a dissimilaridade (distancia) da composicao de duas amostras. 
# 0 = os dois sitios tem mesma composicao de especies.
# 1 = os dois sitios tem especies totalmente diferentes. 

# Problema = Influenciado fortemente pelas especies dominantes e da pouco
# valor as especies raras. 

# 3. Escolha do metodo de agrupamento para criar finalmente o cluster ----
# Aqui iremos representar graficamente a matriz de similaridade.
# Baseado na matriz de distancia iremos construir o cluster.

# Voce escolhe o melhor metodo para seus dados, como ser: hierarquico,
# sequencia, probabilistico, etc!

## EX 1.Temos uma planilha com presenca e ausencia de caracteres----
# morfologicos de diferentes especies.
install.packages("cluster")
library(cluster)
install.packages("vegan")
library(vegan)

# Iremos utilizar dados de presenca (2) e ausencia (1) de animais
data(animals)
animais<-animals 
animais1<-animais[1:10,] # Iremos eliminar os animais com NA
animais1 == 2

# 1. Medida de semelhanca: Matriz de dissimiraridade
matriz <- vegdist(animais1, method = "jaccard") 
# Usamos Jaccard porque os valores sao binarios.
matriz1 <- matriz-1
# Funcao vegdist usa dissimilaridade de jaccard, para transformar em 
# similaridade subrai a matriz menos 1!

# 2. Cluster hierarquico
cluster <- hclust(matriz1, method="average") 
plot(cluster)
rect.hclust(cluster, h = -0.75) # criar blocos na altura desejana.

## EX 2. Planilha de abundancia de 30 especies vegetais em 20 locais----
data(dune) 
t(dune)

# 1. Matriz:
d <- vegdist(dune, method = "bray") 
d

# 2. Cluster hierarquico com Bray-Curtis
cluster1 <- hclust(d, method = "average")
plot(cluster1)
dendro.cluster1 <- as.dendrogram(cluster1) 
plot(dendro.cluster1)
rect.hclust(cluster1, h = 0.70)