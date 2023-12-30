## Pao ying chub
play_pyc <- function() {
  user_score <- 0
  computer_score <- 0

  print("Hello, player!")
  print("What's your name")
  name <- readLines("stdin",n=1)
  print(paste("Hi", name ,"My name is Computer"))

  print("Are you ready (yes/no)")
  ready <- tolower(readLines("stdin", n = 1))

  if (ready == "yes") {
  
    print("This is a PAO YING CHUB game")
    print("You need to guess -> rock, paper, or scissors to win the game.")
    print("If you win, you will get 1 point")
    print("If you lose, you will lose 1 point")
    print("If you want to exit the game, type 'exit'")
    print("Let's strat!")
    
    while (TRUE) {
      print("Your turn")
      user <- readLines("stdin",n=1)
      choices <- c("rock", "paper", "scissors")
      
      # Check if user wants to quit
      if (user == "quit") {
        break
      }
      
      # Validate user input if not quitting
      if (!user %in% choices) {
        cat("Invalid choice. Please choose from rock, paper, or scissors.\n")
        next
      }
      
      # Continue the game if user doesn't want to quit and input is valid
      random_choice <- sample(choices, 1)
      
      if (random_choice == "rock") {
        outcome <- ifelse(user == "rock", "It's a tie!", ifelse(user == "paper", "You win!", "You lose!"))
      } else if (random_choice == "paper") {
        outcome <- ifelse(user == "rock", "You lose!", ifelse(user == "paper", "It's a tie!", "You win!"))
      } else if (random_choice == "scissors") {
        outcome <- ifelse(user == "rock", "You win!", ifelse(user == "paper", "You lose!", "It's a tie!"))
      } else {
        cat("Invalid choice. Please choose from rock, paper, or scissors.\n")
        next
      }
      
      # Update scores based on the outcome
      if (outcome == "You win!") {
        user_score <- user_score + 1
      } else if (outcome == "You lose!") {
        computer_score <- computer_score + 1
      }
      
      # Display individual outcomes
      cat("\nComputer's choice:", random_choice, "\n")
      cat(outcome, "\n")
      cat("Your score:", user_score, "\n")
      cat("Computer score:", computer_score, "\n")
    }
    
    # Display final scores and determine the winner
    cat("\nThanks for playing my game")
    cat("\nFinal Scores\n")
    cat("You:", user_score, "\n")
    cat("Computer:", computer_score, "\n")
    
    if (user_score > computer_score) {
      cat("Congratulations! You won the game!\n")
    } else if (user_score < computer_score) {
      cat("Sorry, you lost the game.\n")
    } else {
      cat("It's a tie!\n")
    }
  }
  else if (ready == "no") {
  cat("Thanks for coming")
  } else {
  cat("Error")
  }
}
play_pyc()



