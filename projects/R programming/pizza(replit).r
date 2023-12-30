# Define pizza sizes and their prices
pizza_sizes <- c("small", "medium", "large")
pizza_prices <- c(200, 300, 400)

# Define pizza toppings and their prices
pizza_toppings <- c("pepperoni", "sausage", "mushroom", "onion", "green peppers")
topping_prices <- c(50, 40, 30, 20, 20)

# Function to process invalid input
handle_invalid_input <- function(message) {
  print(message)
  readLines("stdin", n = 1)
}

# Function to order pizza
order_pizza <- function() {
  # Greet the customer
  print("Welcome to our Pizza restaurant!")

  # Get customer's name
  print("What's your name?")
  name <- readLines("stdin", n = 1)
  print(paste("Hi", name))
  print("Let's me introduce you for our size and topping options")
  print("Size: small, medium, large")
  print("Price of size: 200, 300, 400")
  print("Topping : pepperoni, sausage, mushroom, onion, green peppers")
  print("Price of topping: 50, 40, 30, 20, 20")

  # Loop until the customer says they are done ordering
  while (TRUE) {
    # Ask for number of pizzas
    print("From my menu, How many pizzas would you like to order today?")
    num_pizzas <- readLines("stdin", n = 1)

    # Validate the number of pizzas
    if (num_pizzas <= 0) {
      handle_invalid_input("Please enter a valid number of pizzas (1 or more):")
      next
    }

    # Process each pizza order
    for (i in 1:num_pizzas) {
      # Ask for pizza size
      print(paste("Please select size of pizza", i, ":"))
      pizza_size <- readLines("stdin", n = 1)

      # Handle invalid pizza size
      while (!pizza_size %in% pizza_sizes) {
        handle_invalid_input("Invalid Pizza size. Please choose again!")
        pizza_size <- readLines("stdin", n = 1)
      }

      # Ask for pizza topping
      print(paste("Please select topping of pizza", i, ":"))
      pizza_toppings <- readLines("stdin", n = 1)

      # Handle invalid pizza topping
      while (!pizza_toppings %in% pizza_toppings) {
        handle_invalid_input("Invalid Pizza topping. Please choose again!")
        pizza_toppings <- readLines("stdin", n = 1)
      }

      # Calculate total price for this order
      pizza_size_index <- which(pizza_sizes == pizza_size)
      pizza_toppings_index <- which(pizza_toppings == pizza_toppings)
      total_price <- pizza_prices[pizza_size_index] + topping_prices[pizza_toppings_index]

      # Confirm order
      cat("\nOrder", i, ":\n")
      cat("Size: ", pizza_size, "\n")
      cat("Topping: ", pizza_toppings, "\n")
      cat("Price: ", total_price, "\n")
    }

    # Ask customers for order again
    print("Would you like to order more? (yes/no):")
    more_orders <- readLines("stdin", n = 1)

    # Break the loop if the customer says they are done ordering
    if (more_orders != "yes") {
      break
    }
  }

  # Summarize all orders
  cat("\nSummary all of order\n")
  for (i in 1:num_pizzas) {
    cat("Order", i, ":\n")
    cat("Size: ", pizza_sizes[pizza_size_index], "\n")
    cat("Topping: ", pizza_toppings, "\n")
    cat("Price: ", total_price, "\n")
  }

  # Thank the customer
  cat("Thanks for ordering!")
}

# Call the function
order_pizza()