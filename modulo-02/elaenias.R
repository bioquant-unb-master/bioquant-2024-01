elaenias <- as.data.frame (fixed_medidas_elaenia_from_medidas_dat)
elaenias$especie <- as.factor(elaenias$especie)
plot(elaenias$compasa, elaenias$comptotbico, xlab = "comprimento da asa", ylab= "comprimento do bico")
boxplot(elaenias$comptotbico~elaenias$especie,
        data=elaenias,
        main="Comprimento do bico por especie",
        xlab="Especie",
        ylab="Comprimento",
        col="orange",
        border="brown"
)
