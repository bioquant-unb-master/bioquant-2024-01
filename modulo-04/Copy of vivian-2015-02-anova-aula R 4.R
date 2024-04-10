# AULA R 4
# ANOVA
# existe uma enorme derivação de nomes
# são todos modelos lineares mas qual é o modelo
# Y em relação a X (Y~X) ou Y modelado por X Y(dep) X(ind)
# Essencialmente a anova é igual ao teste t no entanto na anova a variavel
# categorica tem mais de 2 niveis
#para ver os resultados usamos summary.aov()

#tres principais pressupostos: 1 - amostras sao independentes 2- homogeneidade 
# amostra nao é influenciada pela anterior nem pela proxima (coleta aleatoria temporal)
# 3- resíduos seguem distribuição normal

# Nosso problema de hoje
# queremos testar a abundancia de jacarés em 3 tipos de ambientes (lagoa aberta,
# lago fechada e canal). Fazemos 15 observações em cada ambiente e obtivemos os seguintes
# resultados
#la  13, 11, 14, 12, 12, 10, 10, 15, 10, 13, 11, 12, 11, 10, 14
#lf  9, 6, 9, 5, 8, 10, 11, 11, 5, 8, 5, 11, 11, 8, 6
#ca  17, 15, 20, 19, 17, 23, 21, 18, 19, 21, 15, 15, 19, 15, 17

#organize a tabela contendo na coluna 1 os ambientes e na coluna 2 as abundancias
amb1<-rep("lagoa_aberta",15)
amb2<-rep("lagoa_fechada",15)
amb3<-rep("canal",15)
la<-c(13, 11, 14, 12, 12, 10, 10, 15, 10, 13, 11, 12, 11, 10, 14)
lf<-c(9, 6, 9, 5, 8, 10, 11, 11, 5, 8, 5, 11, 11, 8, 6)
ca<-c(17, 15, 20, 19, 17, 23, 21, 18, 19, 21, 15, 15, 19, 15, 17)
dataframe1<-data.frame(amb1,la)
dataframe2<-data.frame(amb2,lf)
dataframe3<-data.frame(amb3,ca)

#juntar em uma só planilha
#e se eu tentar
dados<-data.frame(dataframe1,dataframe2,dataframe3) # não funciona
dados<-merge(dataframe1,dataframe2,dataframe3) #não funciona
dados<-rbind(dataframe1,dataframe2,dataframe3) #não funciona

#mudar o nome das colunas (titulos)
colnames(dataframe1)<-c("ambiente","abundancia")
colnames(dataframe2)<-c("ambiente","abundancia")
colnames(dataframe3)<-c("ambiente","abundancia")

dados<-rbind(dataframe1,dataframe2,dataframe3) # funciona perfeitamente

# PRONTO TEMOS A TABELA PARA A ANOVA
# Aqui queremos avaliar se a abundancia varia de acordo com o ambiente
#logo queremos avaliar se Y~X 
# qual a função para anova?
??fitvariance

# Fazemos a anova
teste<-aov(abundancia~ambiente,data=dados)
summary(teste)

#vamos testar se a premissa de normalidade é atendidas (testar os resíduos)
shapiro.test(resid(teste)) # pq o resíduo é aquilo nao explicado pelo modelo as outras variaveis nao incluídas
# e a variancia
install.packages("lawstat")
library(lawstat)
levene.test(dados$abundancia,dados$ambiente) # varifica a variancia / homocedasticidade modelos se adaptam bem a reta linear numa regressao

#como o teste foi significativo da anova queremos verificar quais grupos diferem entre si
TukeyHSD(teste) #todos os tratamentos diferem entre si verifica as medias diferindo entre si

#plotar o gráfico
boxplot(abundancia~ambiente,data=dados)


linear<-lm(abundancia~ambiente,data=dados)
anova(linear)

#Exercicio
install.packages("MASS")
library(MASS)
data(crabs)
#DENTRO DOS DADOS CRABS OBTIDOS NO PACOTE MASS VERIFIQUE A VARIAÇÃO DE LOBO FRONTAL EM RELAÇÃO A ESPECIE
# E AO SEXO, TESTE SE HÁ INTERAÇÃO ENTRE AS CARACTERISTICAS SEXO E ESPECIE apresente o gráfico de interação
# realize as análises a posteriori 
exe<-aov(crabs$FL~crabs$sex+crabs$sp+crabs$sex:crabs$sp)
summary(aov(crabs$FL~crabs$sex+crabs$sp+crabs$sex:crabs$sp))
interaction.plot(crabs$sex,crabs$sp,crabs$FL)#confirma que há interação
shapiro.test(resid(exe)) # é normal
levene.test(crabs$FL,crabs$sex) #homocedastico
levene.test(crabs$FL,crabs$sp) # homocedastico
plot(TukeyHSD(exe)) #plot do tukey o que está a direita do pontilhado é significativo
