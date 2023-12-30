# HW01 - 5 question ask about flights dataset

library(nycflights13)
library(dplyr)

## 1.What is the average departure delay for each airline, and which airline has the highest average departure delay?

flights %>%
  group_by(carrier) %>%
  summarize(avg_departure_delay = mean(dep_delay, na.rm = TRUE)) %>%
  arrange(desc(avg_departure_delay)) %>%
  head(1)

## 2.How does the average arrival delay vary across months?

flights %>%
  group_by(month) %>%
  summarize(avg_arrival_delay = mean(arr_delay, na.rm = TRUE)) %>%
  arrange(month)

## 3.For flights departing from JFK with a delay greater than 2 hours, what is the average departure delay for each carrier?

jfk_long_delay_flights <- filter(flights, origin == "JFK" & dep_delay > 120)
avg_delay_by_carrier <- jfk_long_delay_flights %>%
  group_by(carrier) %>%
  summarize(avg_dep_delay = mean(dep_delay, na.rm = TRUE))
print(avg_delay_by_carrier)

## 4.For each carrier, what is the average airtime and its standard deviation?

flights %>%
  group_by(carrier) %>%
  summarize(avg_airtime = mean(air_time, na.rm = TRUE),
            sd_airtime = sd(air_time, na.rm = TRUE))
    
## 5.Identify the day of the week with the highest cancellation rate.

flights %>%
  mutate(cancelled = ifelse(is.na(dep_time), TRUE, FALSE)) %>%
  group_by(day = weekdays(as.Date(time_hour))) %>%
  summarize(cancel_rate = mean(cancelled)) %>%
  arrange(desc(cancel_rate)) %>%
  head(1)

# HW02 - create a pizza restaurant database in Postgresql using R-studio

library(RPostgreSQL)
library(tidyverse)

# connect db
con <- dbConnect(PostgreSQL(),
                 host = "kiouni.db.elephantsql.com",
                 port = 5432,
                 user = "jkevwthi",
                 password = "2uMqhde134Mp8odtwzqQWTfuJhd4fd1A",
                 dbname = "jkevwthi")
dbListTable(con)

# Create the 'customers' table
dbCreateTable(conn, "customers",
              customer_id = integer(),
              first_name = character(),
              last_name = character(),
              email = character(),
              phone_number = character())

# Create the 'pizzas' table
dbCreateTable(conn, "pizzas",
              pizza_id = integer(),
              name = character(),
              price = numeric())

# Create the 'orders' table
dbCreateTable(conn, "orders",
              order_id = integer(),
              customer_id = integer(),
              pizza_id = integer(),
              quantity = integer(),
              order_date = date())

# Insert data into the 'customers' table
dbInsert(conn, "customers", values = c(1, "John", "Doe", "johndoe@email.com", "123-456-7890"))
dbInsert(conn, "customers", values = c(2, "Jane", "Smith", "janesmith@email.com", "987-654-3210"))

# Insert data into the 'pizzas' table
dbInsert(conn, "pizzas", values = c(1, "Pepperoni", 12.99))
dbInsert(conn, "pizzas", values = c(2, "Cheese", 10.99))
dbInsert(conn, "pizzas", values = c(3, "Hawaiian", 13.99))

# Insert data into the 'orders' table
dbInsert(conn, "orders", values = c(1, 1, 1, 2, "2023-10-04"))
dbInsert(conn, "orders", values = c(2, 2, 2, 3, "2023-10-05"))

dbClose(conn)
