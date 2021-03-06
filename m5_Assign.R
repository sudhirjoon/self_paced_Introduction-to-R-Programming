
#Importing and Installing____________________________________________________________________________________________________

setwd("C:/Users/ICH/Google Drive/Data Science/Edureka/self_paced_Introduction to R Programming/module_5 Data Visualistaion")
housing <- read.csv("housing_m5.csv")

install.packages("ggplot2")
library(ggplot2)
#2 data structure and concise summary_______________________________________________________________________________________
head(housing)
dim(housing)
str(housing)
sum(is.na(housing))
housing

#3 Scatter plot_____________________________________________________________________________________________________________

plot(housing$Income ~ housing$Credit_Record)

housing$Credit_Record <- as.factor(housing$Credit_Record)

plot(housing$Income ~ housing$Credit_Record) # the new plots are two boxplots

#4 ggplot plot_______________________________________________________________________________________________________________


#color argument which should be dependent on the No_kids of the applicant
ggplot(housing, aes(x= housing$Income , y = housing$PropertyValue, col =housing$No_kids)) +geom_point()

#size argument which should be dependent on the No_kids
ggplot(housing, aes(x= housing$Income , y = housing$PropertyValue, col =housing$No_kids, size = housing$No_kids)) +geom_point()

# smooth line using the geom_smooth() function
ggplot(housing, aes(x= housing$Income , y = housing$PropertyValue, col =housing$No_kids, size = housing$No_kids)) +geom_point()+ geom_smooth(se =FALSE)


#5 ggplot comparison to scatter plot__________________________________________________________________________________________

plot(housing$PropertyValue ~ housing$Income, col = housing$No_kids )
housing$No_kids <- as.factor(housing$No_kids)

plot(housing$PropertyValue ~ housing$Income, col = housing$No_kids )
ggplot(housing, aes(x= housing$Income , y = housing$PropertyValue, col = housing$No_kids)) +geom_point()


#6 Aesthetics________________________________________________________________________________________________________________


#Adding xlab and ylab
ggplot(housing, aes(x= housing$Income , y = housing$PropertyValue, col = housing$No_kids)) 
+geom_point() + xlab("Income") +ylab("Property Value")


#flip the plot via coord_flip()
ggplot(housing, aes(x= housing$Income , y = housing$PropertyValue))+geom_point() + xlab("Income") +ylab("Property Value") + coord_flip()

#flip the plot and add col to NO_kids
ggplot(housing, aes(x= housing$Income , y = housing$PropertyValue, col = housing$No_kids))+geom_point() + xlab("Income") +ylab("Property Value") + coord_flip()


#change shape and size of the points
ggplot(housing, aes(x= housing$Income , y = housing$PropertyValue, col = housing$No_kids,size = housing$No_kids))+geom_point(shape= 17) + xlab("Income") +ylab("Property Value") + coord_flip()

#7 Geometry_____________________________________________________________________________________________________________________

#ggplot Income vs  property value
ggplot(housing, aes(x= housing$Income , y = housing$PropertyValue))+geom_point() + xlab("Income") +ylab("Property Value") + coord_flip()


#make a plot with grom_jitter()
ggplot(housing, aes(x= housing$Income , y = housing$PropertyValue))+geom_jitter() + xlab("Income") +ylab("Property Value") + coord_flip()

# setting width 0.1 in geom_width()
ggplot(housing, aes(x= housing$Income , y = housing$PropertyValue))+geom_jitter(width = 0.1) + xlab("Income") +ylab("Property Value") + coord_flip()


#8 Histogram________________________________________________________________________________________________________________________

#univariate INCOME histogram
ggplot(housing, aes(x= housing$Income))+geom_histogram()

#adding binwidth to histogram layer
ggplot(housing, aes(x= housing$Income))+geom_histogram(binwidth = 100)

#In the above plot,  MAP ..density.. to the y aesthetic (i.e. in a second aes() function) 
ggplot(housing, aes(x= Income,y = ..density..))+geom_histogram(binwidth = 100) + geom_density(aes(y= ..density..), color = "red")

# Finally, in the above plot, plus SET the fill attribute to "#377EB8"
ggplot(housing, aes(x= Income,y = ..density.. ))+geom_histogram(binwidth = 100) + geom_density(aes(y= ..density.. , fill = "#377EB8"), color = "red")


#9 Bar Plot _________________________________________________________________________________________________________________________

#Draw a bar plot of Property_Purchased, filled according to Education
ggplot(housing, aes(x = Property_Purchased, fill = Education)) + geom_bar()

#In the above plot, Change the position argument to "stack"
ggplot(housing, aes(x = Property_Purchased, fill = Education)) + geom_bar(position = "stack")

#In the above plot, Change the position argument to "fill"
ggplot(housing, aes(x = Property_Purchased, fill = Education)) + geom_bar(position = "fill")

#In the above plot, Change the position argument to "dodge" - proportion barplot

ggplot(housing, aes(x = Property_Purchased,  fill = Education)) + geom_bar(position = "dodge")


#10 Overlapping bar plots ___________________________________________________________________________________________________________

#Take the last plot form the previous exercise
ggplot(housing, aes(x = Property_Purchased,  fill = Education)) + geom_bar(position = "dodge")

#In the above plot, Define posn_d with position_dodge(). Take value as 0.7
posn_d <- position_dodge(0.7)

#Change the position argument to posn_d in the last plot made in Step 9(d)
ggplot(housing, aes(x = Property_Purchased,  fill = Education)) + geom_bar(position = posn_d)

# Use posn_d as position and adjust alpha to 0.6 -can you see the overlap in bars. If not, change the value of alpha
ggplot(housing, aes(x = Property_Purchased,  fill = Education)) + geom_bar(position = posn_d, alpha = 0.6)


#11 Overlapping Histograms ____________________________________________________________________________________________________________

#A basic histogram, add coloring defined by Income and filled by HasCar, select a suitable binwidth
ggplot(housing, aes(x= Income, fill = HasCar))+geom_histogram(binwidth = 100)

#In the above plot, In the above chart, Change position to identity
ggplot(housing, aes(x= Income, fill = HasCar))+geom_histogram(binwidth = 5000, position = "Identity")


#12 Faceting___________________________________________________________________________________________________________________________

#Now create a basic scatter plot between income and property value variables 
ggplot(housing, aes(x= PropertyValue , y = Income))+geom_point()


#In the above plot, Separate rows according to HasCar
ggplot(housing, aes(x= PropertyValue , y = Income, col = HasCar))+geom_point()+facet_grid(rows = vars(HasCar))










