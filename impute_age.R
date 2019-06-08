library("readxl")
library("stringr")
library("dplyr")
library("ggplot2")
#library("mice")

# xls files
titanic_data <- read_excel("titanic3.xls")

titanic_age_data <- select(titanic_data, c("name","survived","age"))

missing_age <- sum(is.na(titanic_data$age))
print(missing_age)
ggplot(titanic_age_data, aes(titanic_age_data$age)) +
  ggtitle("Age distribution before impute")+
  geom_bar(fill = "#0073C2FF") 

#mi <- mice(titanic_selected_data)
#imputed_data <- complete(mi)
#print(imputed_data)

#i have not used mice, i can't istall it due to memmory issues.


titanic_age_data[is.na(titanic_age_data$age),] <- 100

missing_age2 <- sum(is.na(titanic_age_data$age))
print(missing_age2)

ggplot(titanic_age_data, aes(titanic_age_data$age)) +
  ggtitle("Age distribution after impute")+
  geom_bar(fill = "#0073C2FF") 