
#importar planilha do github modulo 8 pesquisa-campo-a-vs-n.xls
#converter para dataframe com o nome quadratsco

#preparar a planilha fazendo a conversao de dados de 2 colunas gramineas lenhosas para 2 colunas tipoveg contagem
library(tidyr)

quadratnovo = quadratsco %>% pivot_longer(cols=c('Gramíneas', 'Lenhosas'),
                    names_to= 'tipoveg',
                    values_to='contagem') 

# montar o modelo linearizado com transformacao poisson, variavel dependente contagem, variaveis 
# independentes tratamento e tipo de vegetacao, mais interacao
resultado = glm(quadratnovo$contagem ~ quadratnovo$Tratamento + quadratnovo$tipoveg + quadratnovo$Tratamento:quadratnovo$tipoveg, family = poisson)
#visualizar o resultado com a significancia do tratamento, do tipo de vegetacao, e da interacao
summary(resultado)
#fazer um boxplot para confirmar visualmente os resultados obtidos

ggplot(quadratnovo, aes(x=Tratamento,y=contagem,fill=tipoveg)) + geom_boxplot()
