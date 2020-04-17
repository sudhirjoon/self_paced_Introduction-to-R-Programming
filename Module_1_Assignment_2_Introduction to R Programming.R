
#TASK 1

First_Hundred <- 1:100

for (i in First_Hundred) {
  if(i %% 2){
    print("Even")
  }else{
    print("Odd")
  }
}

#TASK 2___________________________________________________________________________________________

#classical approach
iris
head(iris)
v2 <- iris$Sepal.Length >6.5
table(v2)

#using condition and loop

count <- 0

for (i in iris$Sepal.Length) {
  if(i > 6.5)  count = count+1
}

print(count)

#TASK 3___________________________________________________________________________________________

#classical approach

head(CO2)

x <- CO2$uptake[CO2$Type == "Mississippi" & CO2$Treatment == "chilled"]
x
class(x)
sum(x) / 21

#using condition and loop
 for (i in CO2$uptake) {
   if(CO2$uptake[CO2$Type == "Mississippi" & CO2$Treatment == "chilled"]){
     print(mean(CO2$uptake[CO2$Type == "Mississippi" & CO2$Treatment == "chilled"]))
     break()
   }
 }
 
 #TASK 4__________________________________________________________________________________________

tapply(CO2$uptake, CO2$Treatment, mean)
tapply(CO2$uptake, CO2$Treatment, median)
tapply(CO2$uptake, CO2$Treatment, min)
tapply(CO2$uptake, CO2$Treatment, max)

#TASK 5___________________________________________________________________________________________
data(swiss)
View(swiss)

install.packages("purrr")
library(purrr)

invoke_map(list(min_fertility = "min",max_infant_mortality = "max"), list(swiss$Fertility, swiss$Infant.Mortality)) 

#TASK 6_____________________________________________________________________________________________

roll<- function(){
  dice <- sample(1:6, size = 1, replace = TRUE)
  return(dice)
}

roll()
