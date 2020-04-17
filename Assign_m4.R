# Import the data
setwd("C:/Users/ICH/Google Drive/Data Science/Edureka/self_paced_Introduction to R Programming/module_4 Data Manipulation")
housing <- read.csv("housingdata_v2.0.csv")

#1 Install the packages
install.packages("dplyr")
library(dplyr)

#2 Understand the data 
dim(housing)
ncol(housing)
View(housing)
str(housing)

#3 Select and Mutate

newHousingdata <- select(housing, c(Gender, Education, Income))
head(newHousingdata)

newHousingdata1 <- select(housing, c(Gender:Loan_Period))
head(newHousingdata1)


newHousingdata2 <- select(housing, -c(Record,Gender))
head(newHousingdata2)

g1<- mutate(housing, var1 = PropertyValue/Income)
head(g1)

g2<- mutate(housing, var2 = PropertyValue/Loan_Period)
head(g2)


#4 Filter and Arrange:

g3 <- filter(housing, PropertyValue<80000 |  PropertyValue>150000 )
head(g3)

g4 <- filter(housing, PropertyValue > 1000000 & Income<3185 )
head(g4)


g5 <- filter(housing, Income < 3185 & Property_Purchased == "Y")
head(g5)



#arrange 

bought <- filter(housing,Property_Purchased == "Y")
dim(bought)

bought <- arrange(bought, Income)
head(bought)

bought <- arrange(bought,Gender)
head(bought)

bought <- arrange(bought, Gender ,Education , .by_group = TRUE)
head(bought, 20)


notBought <- filter(housing, Property_Purchased == "N")
dim(notBought)

notBought <- arrange(housing, Income)
head(notBought)

notBought <- arrange(housing, Gender)
head(notBought)

notBought <- arrange(bought, Gender ,Income , .by_group = TRUE)
head(notBought, 20)

newData <- housing %>% arrange(Gender) %>% arrange(desc(Income)) 
head(newData)


#5. Summarise function

summarise(housing, min(Income) , max(Income))

summarise(housing, minIncome = min(Income) ,maxIncome = max(Income) , avgIncome = mean(Income), 
          sdIncome = sd(Income), iqrIncome = IQR(Income))

summarise(housing, min = min(Loan_Period), max = max(Loan_Period), avg = mean(Loan_Period), 
          sd = sd(Loan_Period), inter_quartile = IQR(Loan_Period))

#6 Pipe operator of dplyr

df <- housing %>% mutate(var1 = PropertyValue/Income) %>% filter(var1 > 50) %>% summarise(avg = mean(var1))
df


#7 group_by function

df1 <- group_by(housing ,Education)
head(df1,20)
df_yes <- filter(df1, Property_Purchased == "Y")

df_yes

summarise(df_yes ,avg_income = mean(Income),avg_Value = mean(PropertyValue))



arrange(summarise(df_yes ,avg_income = mean(Income),avg_Value = mean(PropertyValue)))








