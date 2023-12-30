install.packages("caret")
install.packages("tidyverse")
install.packages("readxl")
library(caret)
library(tidyverse)
library(readxl)

# import data
houseprice_india <- read_excel("House Price India.xlsx")
View(houseprice_india)

## clean data 
names(houseprice_india)<-tolower(names(houseprice_india))
houseprice_india %>% 
  complete.cases()
glimpse(houseprice_india)

# plot distribution of Price
hist(houseprice_india$price)
houseprice_india$price <- log(houseprice_india$price)
hist(houseprice_india$price)

# subset data 
full_df<- houseprice_india %>% 
  select (number.of.bathrooms,
          living.area,
          built.year,
          postal.code,
          distance.from.the.airport,
          price)


#1 split data 
split_df <- function(df) {
  set.seed(42)
  n <- nrow(df)
  train_id <- sample (1:n, size = 0.8*n )
  train_df <- df[train_id, ]
  test_df <- df[-train_id, ]
  return( list (training = train_df,
                testing = test_df) )
}

prep_data <- split_df(clean_df)
train_df <- prep_data[[1]]
test_df <- prep_data[[2]]

# 2 train model 
set.seed(42)
lm_model <- train(price ~ . ,
                  data = train_df,
                  method = "lm")


#3. score  model 
p<-predict (lm_model, newdata = test_df)

#4 evaluate model 
lm_model

#mean absolute error
(mae <- mean(abs(p - test_df$price)))

#root mean square error 
(rmse <-  sqrt(mean((p - test_df$price)**2)))


