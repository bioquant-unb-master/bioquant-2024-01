#Pratica para examinar dados de diferentes tipos em R
#
#Usaremos alguns conjuntos de dados ja distribuidos com o R:
# cars, mtcars, iris, 
# nosso primeiro objetivo sera entender quais os tipos de variaveis presentes
# vamos carregar primeiro o conjunto mtcars
data(mtcars)
str(mtcars)
# Todas as variaveis sao numericas. Entretanto algumas na realidade sao
# categoricas, ou seja o numero na realidade se refere a uma classe
#quais variaveis sao categoricas nesta amostra?
# vamos recodifica-las usando a funcao as,factor
# substitua o x pela variavel de interesse e aplique a funcao
mtcars$x <- as.factor(mtcars$x)
#agora vamos fazer alguns graficos
# barplot: grafico de barras , frequencias de observacoes das variaveis categoricas
# histogram:  distribuicao de frequencias para variaveis continuas
# boxplot:  como visualizar variaveis categoricas e continuas simultaneamente
# grafico x y ou grafico de dispersao - visualizar variaveis continuas
# o R tem funcoes para fazer estes graficos
# alternativamente podemos usar o pacote ggplot2 que tem um conjunto de
# comandos quase interminavel. Para ter uma ideia do que pode fazer veja
#este site
# http://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html
# 
# Mas vamos ser simples aqui
# Primeiro vamos converter o numero de marchas de variavel numerica para categorica
mtcars$gear <- as.factor(mtcars$gear)
#agora vamos fazer um barplot
ggplot (mtcars, aes(x = gear)) + geom_bar()
# Em seguida vamos fazer um histograma, para milhas por galao:
milhagem <- mtcars$mpg
hist(milhagem)
#agora vamos fazer um boxplot de milhagem por marchas
# https://www.tutorialspoint.com/r/r_boxplots.htm
boxplot(mpg ~ gear, data = mtcars, xlab = "Numero de marchas",
        ylab = "Milhas por Galao", main = "Milhagem")
# como fazer legendas:
# http://www.sthda.com/english/wiki/add-legends-to-plots-in-r-software-the-easiest-way
#
# Finalmente, vamos fazer um grafico de dispersao:
# escolha 2 variaveis numericas x e y
#use o comando plot(x,y) para ver a relacao entre elas