library("readxl")
library("stringr")
library("dplyr")
library("ggplot2")

familyname <- function(name)
              {
                   family <- word(name, 1,sep = fixed(","))
              }

# xls files
titanic_data <- read_excel("titanic3.xls")

titanic_data$FamilySize <- titanic_data$sibsp + titanic_data$parch +1;

titanic_data <- mutate(titanic_data, "family" = familyname(titanic_data$name) )

titanic_selected_data <- select(titanic_data, c("name","survived","family","FamilySize"))

print(titanic_selected_data)

ggplot(titanic_selected_data, aes(FamilySize)) +
geom_bar(fill = "#0073C2FF") 
