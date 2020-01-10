# Big_Data_Opcional


**Pregunta 1**

El analisis de una estadística descriptiva comenzará con la ejecución del comando summary(Datos_Nomofobia), donde mostrará la media, mediana, moda y percentiles de las
variables a analizar.


 **Nomofobia         Estrés              Ansiedad            Compulsividad**  
 Min.   : 1.00       Min.   : 5.00       Min.   : 4.00       Min.   : 1.00  
 1st Qu.:25.00       1st Qu.:32.00       1st Qu.:26.00       1st Qu.:36.00  
 Median :50.00       Median :49.00       Median :51.00       Median :50.00  
 Mean   :50.88       Mean   :51.46       Mean   :52.15       Mean   :52.87  
 3rd Qu.:75.00       3rd Qu.:72.00       3rd Qu.:77.00       3rd Qu.:74.00  
 Max.   :99.00       Max.   :97.00       Max.   :99.00       Max.   :99.00  
 

**Habilidades blandas     Resolución de conflictos     Tiempo de uso del celular**
   Min.   :  1.00         Min.   :-10.00               Min.   :-15.00           
   1st Qu.: 28.00         1st Qu.: 20.00               1st Qu.: 34.00           
   Median : 54.00         Median : 52.00               Median : 57.00           
   Mean   : 57.71         Mean   : 49.61               Mean   : 54.83           
   3rd Qu.: 77.00         3rd Qu.: 74.00               3rd Qu.: 74.00           
   Max.   :350.00         Max.   : 99.00               Max.   : 99.00           


 **Género               Edad **     
 Length:129             Min.   :20.00  
 Class :character       1st Qu.:22.00  
 Mode  :character       Median :25.00  
                        Mean   :24.59  
                        3rd Qu.:27.00  
                        Max.   :30.00  

La unica variable que en un principio no es posible realizar una estadística descriptiva es "Genero" por ser una variable cualitativa.



**Pregunta 2** 

Para el analisis de Normalidad, Kurtosis y Asimetria se utilizan los comandos Kurtosis(Data[-8]) y Skewness(Data[-8]), el numero en corchetes indicará el numero de decimales del valor entregado, ademas de graficos de histogramas. 
Como se solicita analisis de normalidad, se utilizará el comando qqnorm para visualizar la normalidad de las variables, donde la curva si se comporta de forma diagonal, 
se cumpliría con dicho supuesto(normalidad), . Si bien la mayoría de las variables cumplen con dicho requisito, esto no ocurre con la variable "Habilidades Blandas", por lo que en primera instancía no tendería a normal por ello se analizará su "skewness" y "kurtosis".

#Skewness#

  Nomofobia                    Estrés                  Ansiedad 
  0.13605192                0.06769615                0.09125894 

 Compulsividad           Habilidades blandas    Resolución de conflictos 
  0.06296501                3.22958177                0.02052786 

Tiempo de uso del celular        Edad 
  -0.15754888                0.23635694 

En un primer instante se debe conocer que la simetría debe ser 0 o cercano a este valor, en este caso la variable "Habilidades Blandas" no cumple con dicho supuesto.


#Kurtosis#

 Nomofobia                    Estrés                  Ansiedad 
 1.804174                    1.963184                 1.774285 
            
Compulsividad       Habilidades blandas       Resolución de conflictos 
 2.028986                23.118473                    1.763247 

Tiempo de uso del celular          Edad 
 2.099065                        1.951769 

En el caso de la kurtosis se trabaja con el supuesto que el valor que debe arrojar no debe superar las 3 unidades, se confirma por lo tanto, que la variable "Habilidades Blandas" no cumple con normalidad.


**Pregunta 3** 

La regresión a utilizar es la siguiente: 
RegresionCompleta<-lm(Datos_Nomofobia$Nomofobia~Datos_Nomofobia$Ansiedad+Datos_Nomofobia$Compulsividad+Datos_Nomofobia$Estrés+Datos_Nomofobia$`Habilidades blandas`+Datos_Nomofobia$`Resolución de conflictos`+Datos_Nomofobia$`Tiempo de uso del celular`+Datos_Nomofobia$Género+Datos_Nomofobia$Edad)


**Pregunta4** 

                            Coeficientes
Constante                :   -0.30657 
Estrés                   :    0.17206
Ansiedad                 :    0.01860  
Compulsividad            :    0.24256
Habilidades Blandas      :    0.03125  
Resolución de Conflictos :   -0.03900  
Tiempo de uso del Celular:    0.57070
Edad                     :   -0.14257 
Genero (mujer)           :    1.82019  

Al analizar los coeficiente, la relación que existe entre las variables independientes "Estrés", "Ansiedad", "Compulsividad", 
"Habilidades Blandas", "Tiempo de uso del celular" y "Genero" es directa, por lo que un aumento en dichas variables provocará
un aumento en el transtorno de "Nomofobia", en el caso de las variables "Resolucion de conflictos" y "Edad", la relación es 
inversa, esto es facil de reconocer ya que los coeficientes son negativos.


**Pregunta 5**

Analisis Anova 

                                             Df Sum Sq Mean Sq F value   Pr(>F)    
Datos_Nomofobia$Ansiedad                      1   1813    1813   3.894 0.050748 .  
Datos_Nomofobia$Compulsividad                 1   9368    9368  20.128 1.67e-05 ***
Datos_Nomofobia$Estrés                        1   6699    6699  14.393 0.000234 ***
Datos_Nomofobia$`Habilidades blandas`         1    421     421   0.905 0.343354    
Datos_Nomofobia$`Resolución de conflictos`    1      1       1   0.003 0.956902    
Datos_Nomofobia$`Tiempo de uso del celular`   1  23935   23935  51.426 6.62e-11 ***
Datos_Nomofobia$Género                        1    106     106   0.227 0.634649    
Datos_Nomofobia$Edad                          1     21      21   0.045 0.831736    
Residuals                                   120  55851     465                     
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Para concluír que una variable explica el efecto de la nomofobia, es necesario observar el valor p, en donde, si este es menor a 0.05, se puede decir que se acepta dicha hipotesis,
esto se observa con las varibles "Ansiedad", "Compulsividad" (analizado con mas de un 99% de confianza) al igual que "Estrés" y "Tiempo de uso del celular". Las variables con un
valor p mayor son "Habilidades Blandas", "Resolución de conflictos", "Genero" y "Edad"

**Pregunta 6**

hist(Datos_Nomofobia$Nomofobia): al ejecutar el comando, el resultado que se obtiene es que su comportamiento no tendería a normal.
boxplot(Datos_Nomofobia$Ansiedad: viendo el boxplot en una primera instancía tenderia a normal, una media de 50, percentil 75 de 75 y percentil 25 de 25, tambien los limites superior e inferior son el 100 y el 0 respectivamente.
barplot(Datos_Nomofobia$Estrés): tomamndo la variable estrés se observa que la concentración es uniforme.


**Pregunta 7**

Identificar Outliers.

Como se ha mencionado en preguntas anteriores la unica variable que no posee una comportamiento normal es "Habilidades Blandas".


**Pregunta 8**

Los outliers deben ser eliminados ya que los valores deben comprender entre el 1 y 100, si los valores estan entre los 200 y 350 son considerados altos.
Por no existir una precisión en las respuestas de las observacion es recomendable eliminar los outliers que son considerados altos. 
 