                       ### BIOLOGIA QUANTITATIVA 2/2020 ###
# MODULO 6 - Distribuicoes Espaciais
# Prof. Dr. Roberto Cavalcanti
# Monitoria: Ana Terra Guedes, Marcela Ponce, Vinícius Telheiro


# Analizando distribuições - dados saída #

# Lembram do que o professor ensinou na aula passada? 
# Então, para verificar se os dados seguem uma distribuição aleatória, 
# vamos gerar uma distribuição aleatória esperada 
# baseada nos nossos dadoscom a ajuda da funcao "goodfit" do pacote "vcd" 

install.packages("vcd")
library(vcd)

# Vamos gerar a distribuição e realizar o teste de qui quadrado, para
# verificar a hipótese de que os dados seguem uma distribuição de poisson.

# Verificamos primeiro com a poisson pois, caso a distribuição
# seja de poisson, significa que a distribuição é aleatória, portanto
# tende a não seguir padrões.

# Confirmando isso, sabemos que segue um padrão e,podemos ir atras dele. 

# Em distribuições uniformes temos -> 
# media MAIOR (ou ligeiramente menor) que a variancia,
# sendo que a divisao media/variancia > 1 

# Ja em uma distribuicao agregada ->
# media MENOR que variancia,
# sendo que a divisao media/variancia <1.


# DADOS:

extinctData = read.csv(url("http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08e6MassExtinctions.csv"))
# Criar objeto do tipo tabela a partir de link da internet

View(extinctData)


?goodfit
# Permite verificar a qualidade do ajuste dos seus dados 
# as seguintes distribuicoes discretas:
# Poisson, binomial ou binomial negativa (Pascal).
# Distribuicoes discretas = descreve a probabilidade de ocorrencia 
# de cada valor de uma variavel aleatoria discreta (contagem).


poissonfit = goodfit(extinctData$numberOfExtinctions,type = "poisson")
# A distribuicao usada deve ser explicitada 

View(poissonfit)


# Histograma:

# Permite fazer uma inspecao vizual da distribuição
hist(extinctData$numberOfExtinctions)
# Essa distribuição parece aleatoria?


# Para verificarmos o resultado do qui quadrado (goodfit) usamos o summary
summary(poissonfit)
# P > ou < que 0.05?
# Portanto aceitamos ou rejeitamos H0?

