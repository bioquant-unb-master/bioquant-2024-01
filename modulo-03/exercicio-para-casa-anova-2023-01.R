#Exercicio para casa modulo 03 Anova Biologia Quantitativa 2023/01




#Instale o pacote MASS usando o Rstudio e visualize o banco de dados crabs
library(MASS)
view(crabs)
#Este banco de dados tem as seguintes variaveis:  especie, sexo, numero da amostra,
#  tamanho lobo frontal mm,  largura posterior mm, comprimento carapaca mm, 
# largura carapaca mm, profundidade do corpo mm
# 
#Faca uma analise de variancia com o seguinte modelo:
#  variacao do lobo frontal em funcao de especie e sexo
# mostre a tabela completa da analise de variancia
# faca um boxplot dos resultados 
#
#Repita a analise de variancia incluindo o componente de interacao entre especie e sexo
# mostre a variancia explicada pela interacao entre especie e sexo - e significativa?
# teste as premissas do modelo de normalidade e homoscedascidade usando
#testes de shapiro e levene - instale o pacote lawstat para usar o teste de levene
# Submeta o script completo no github da turma