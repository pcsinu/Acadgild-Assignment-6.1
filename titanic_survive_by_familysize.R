library("readxl")
library("stringr")
library("dplyr")
library("ggplot2")

# xls files
titanic_data <- read_excel("titanic3.xls")

titanic_data$FamilySize <- titanic_data$sibsp + titanic_data$parch +1;

ggplot(titanic_data, aes(x=FamilySize, fill=factor(survived))) +
  geom_histogram(bins=30)+
  ggtitle("Family Size vs Survived")+
  scale_fill_discrete(name="Survived")