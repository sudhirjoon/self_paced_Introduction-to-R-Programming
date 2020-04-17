
#TASK 1
a <- rnorm(3,5,1)
b <- rnorm(3,3,1)
cq <- rnorm(4,1,2) 

random <- c(a,b,cq)
plot(random)
summary(random)
#TASK2

a1 <- seq(1:5)
log_a1 <- log(a1)
a2 <- seq(6:10)
exp_a2 <- exp(a2)

log_a1
exp_a2

LogExpo <- c(log_a1,exp_a2)
LogExpo
plot(LogExpo)

summary(LogExpo)
#TASK 3

thousand <- seq(1:1000)
neg_thousand <- rev(seq(-1000:0))

thousand
neg_thousand
Final_Thousand <- c(-neg_thousand,thousand)

Final_Thousand
plot(Final_Thousand)

summary(Final_Thousand)

#TASK 4

Final_Thousnad_500 <- Final_Thousand[1:500]
first_hundred <- Final_Thousnad_500[1:100]

summary(first_hundred)


#IF and ELSE condition in R

sub_1 <- 90
sub_2 <- 80
sub_3 <- 29
sub_4 <- 11
sub_5 <- 99

passing_marks <- 250
Total_marks <- sum(sub_1,sub_2,sub_3,sub_4,sub_5)

if(Total_marks>passing_marks){
  v0 <- paste("You scored" , Total_marks)
  print(V0)
  print("You have passed the exam")
  }else
{
  v0 <- paste("You scored ", Total_marks)
  
  
  marks_required <- passing_marks - Total_marks
  v1 <- "Additional marks required are"
  v2 <- paste(v1, marks_required)
  
  print(v0)
  print (v2)
  print("Please apply again for the exam") 
}

#Else if

sub_1 <- 38
sub_2 <- 80
sub_3 <- 01
sub_4 <- 78
sub_5 <- 49

Total_marks <- sum(sub_1,sub_2,sub_3,sub_4,sub_5)

if(Total_marks >= 400){
  v3 <-paste("your score is",Total_marks)
  print(v3)
    print("your grade is EXCELLENT")
  } else if (Total_marks >= 300){
  v3 <-paste("your score is",Total_marks)
  print(v3)
    print("your grade is VERY GOOD")
  }else if (Total_marks >= 250){
    v3 <-paste("your score is",Total_marks)
    print(v3)
    print("Your grade is GOOD")
  }  else {
  v3 <-paste("your score is",Total_marks)
  print(v3)
  print("Unfortunately you haven't passed the exam")
  }

#While loop ________________________________________________________________________

shopping_money <- 100
i <- 1

while (shopping_money > 30) {
  v1 <- i
  v2 <- "Lets shop for:"
  v3 <-"th time"
  
  v4 <- paste(v2,v1,v3)
  print(v4)
  
  i = i+1
  
  shopping_money <- shopping_money - 20
  money_left <- shopping_money
  
  v2 <- paste("Moeny left is:" , money_left)
    print(v2)
  
  }

#For loop _________________________________________________________________________

vec <- 1:100

for (e in vec) {
  if (e == 10)
      break
  if(e == 4)
    next
  print (e)
}

#Repeating loops _________________________________________________________________

i <- 10

repeat{
  v1 <- "my value is"
  v2 <- paste(v1,i)
  print(v2)
  if(i<20)
    break
}



#In_built Functions________________________________________________________________
data("mtcars")
colnames(mtcars)

head(mtcars)
mtcars$mpg

sort(mtcars$mpg , decreasing = TRUE) # Decreassing order

table(mtcars$cyl)

prop.table(table(mtcars$cyl)) # proportion of 4/6/8 type cylinder car engine types

mean(mtcars$mpg)
sum(mtcars$mpg)

#horzontal and vertical calulation using apply function 

#apply function_____

data(iris)
head(iris)

apply(iris[1:4],2,mean) # mean of 4 column together
apply(iris[1:4],2,median)
apply(iris[1:4],2,sum)

apply(iris[1:4],1,sum) # there are 150 rows in the dataset, sum of 150 rows is shown in the rows 

#t apply function, helps in grouping ____ 

tapply(iris$Petal.Length, iris$Species, mean) # variable where function need to apply , groupping variable , function
tapply(iris$Sepal.Length, iris$Species, mean)


#map_dbl functions ________

install.packages("purrr")
library(purrr)

map_dbl(mtcars, mean) #same like apply function , works on columns
map_dbl(mtcars, sum)
map_dbl(mtcars, median)


#invoke_map_____
  #Used when we want to apply two functions together
invoke_map(list(min_sepal_legth = "min",max_sepal_width = "max"), list(iris$Sepal.Length, iris$Petal.Width)) 

invoke_map(list(min_sepal_legth = "min",mean_sepal_width = "mean"), list(iris$Sepal.Length, iris$Petal.Width)) 


#Customized fun / User defined fun______________________________________________________________________________________________

#step 1: Build a function
fun1 <- function(x){ print(x)}
#Step 2: Execute the function  
fun1(100)

fun1(c(1:10))
fun1(c("Sudhir", "Ravi"))

fun1(c(T,F,T,T,F,T))

fun1(list(c(T,F,T,T,F,T), c("Sudhir", "Ravi"), c(1:10)))


#Power 2 function 

fun_pow <- function(x){x^2}
fun_pow(6)

add <- function(x,f){x+f}
add(2,3)

add(5, fun_pow(4)) #use of function inside function 


## loops function _________

mean_of_All_cols <- function(x){
  for(i in x){
    print(mean(i))
    }
}

mean_of_All_cols(iris[-5]) # sum of all columns of iris dataset except col 5


## local variable concept in R

fun5 <- function(){
  x                    #local variable - var defined inside function 
  y = 20
  x+y
  }

x = 70                #Global var - global var value is used inside fun
fun5()

fun6 <- function(){
  x =75                   #local variable - will take precedence over gloabl var 
  y = 20
  x+y
}

fun6()


## create your own function

normalise <- function(x){
  (x - range(x)[1]) / (max(x) -min(x)) #[1] defines the first element of range i.e. min and sexond element is max
}

normalise(iris$Sepal.Length)













