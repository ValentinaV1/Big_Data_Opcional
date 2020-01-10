#Ejercicio1#

Dato_Nomofobia <- read_excel("Dato_Nomofobia.xlsx")

summary(Dato_Nomofobia)

hist(Dato_Nomofobia$Nomofobia)
hist(Dato_Nomofobia$Ansiedad)
hist(Dato_Nomofobia$Estrés)
hist(Dato_Nomofobia$Compulsividad)
hist(Dato_Nomofobia$`Habilidades blandas`)
hist(Dato_Nomofobia$`Resolución de conflictos`)
hist(Dato_Nomofobia$`Tiempo de uso del celular`)
hist(Dato_Nomofobia$Edad)


#Ejercicio2#

library(moments)
skewness(Dato_Nomofobia[-8])
kurtosis(Dato_Nomofobia[-8])
par(mfcol=c(2,4))
qqnorm(Dato_Nomofobia$Nomofobia)
qqnorm(Dato_Nomofobia$Ansiedad)
qqnorm(Dato_Nomofobia$Estrés)
qqnorm(Dato_Nomofobia$Compulsividad)
qqnorm(Dato_Nomofobia$`Habilidades blandas`)
qqnorm(Dato_Nomofobia$`Resolución de conflictos`)
qqnorm(Dato_Nomofobia$Edad)

#Ejercicio3#

RegresionCompleta<-lm(Dato_Nomofobia$Nomofobia~Dato_Nomofobia$Ansiedad+Dato_Nomofobia$Compulsividad+Dato_Nomofobia$Estrés+Dato_Nomofobia$`Habilidades blandas`+Dato_Nomofobia$`Resolución de conflictos`+Dato_Nomofobia$`Tiempo de uso del celular`+Dato_Nomofobia$Género+Dato_Nomofobia$Edad)
RegresionCompleta


#Ejercicio5#

ANOVA1<-aov(Dato_Nomofobia$Nomofobia~Dato_Nomofobia$Ansiedad+Dato_Nomofobia$Compulsividad+Dato_Nomofobia$Estrés+Dato_Nomofobia$`Habilidades blandas`+Dato_Nomofobia$`Resolución de conflictos`+Dato_Nomofobia$`Tiempo de uso del celular`+Dato_Nomofobia$Género+Dato_Nomofobia$Edad)
summary(ANOVA1)

#Ejercicio6#

hist(Dato_Nomofobia$Nomofobia)
boxplot(Dato_Nomofobia$Ansiedad)
barplot(Dato_Nomofobia$Compulsividad)

#Ejercicio7#

par(mfcol=c(2,4))
boxplot(Dato_Nomofobia$Nomofobia,main= "Nomofobia")
boxplot(Dato_Nomofobia$Ansiedad,main= "Ansiedad")
boxplot(Dato_Nomofobia$Estrés,main= "Estres")
boxplot(Dato_Nomofobia$Compulsividad,main= "Compulsividad")
boxplot(Dato_Nomofobia$`Habilidades blandas`,main= "Habilidades Blandas")
boxplot(Dato_Nomofobia$`Resolución de conflictos`,main= "Resolucion de Conflictos")
boxplot(Dato_Nomofobia$Edad,main= "Edad")
boxplot(Dato_Nomofobia$Nomofobia~Dato_Nomofobia$Género,main= "Genero")


#Ejercicio8#

DatosFinal<-Dato_Nomofobia[c(-5,-11,-106),]
DatosFinal_Sin_Negativosa<-DatosFinal[c(-46,-41,-126,-31),]
