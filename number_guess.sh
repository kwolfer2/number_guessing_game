#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
# Get username
echo "Enter your username:"
read INPUT_USERNAME
# Get user_id from INPUT_USERNAME
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$INPUT_USERNAME'")
# Check for existing user
if [[ -z $USER_ID ]]
  then 
    #Create new user as USERNAME
    $PSQL "INSERT INTO users(username, games_played) VALUES ('$INPUT_USERNAME', 0);"
    USERNAME=$INPUT_USERNAME
    echo "Welcome, $USERNAME! It looks like this is your first time here."
  else
    # Welcome returning user and display GAMES_PLAYED and BEST_GAME
    USERNAME=$($PSQL "SELECT username FROM users WHERE user_id = $USER_ID")
    USERNAME=$(echo $USERNAME | xargs)
    GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
    BEST_GAME=$($PSQL "SELECT best_guess FROM users WHERE username='$USERNAME'")
    GAMES_PLAYED=$(echo $GAMES_PLAYED | xargs)
    BEST_GAME=$(echo $BEST_GAME | xargs)
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
# Define guessing function
GUESS_MENU() {
# Check if user is already in game
if [[ ! -z $1 ]]
then
echo "$1"
fi

# collect and store guess, increment guesses
read CURRENT_GUESS
NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))

if ! [[ $CURRENT_GUESS =~ ^[0-9]+$ ]]
  then GUESS_MENU "That is not an integer, guess again:"
elif [[ $CURRENT_GUESS -eq $SECRET_NUMBER ]]
then 
# User guesses correctly
  $PSQL "UPDATE users SET games_played = $GAMES_PLAYED WHERE username = '$USERNAME'"
  if [[ -z $BEST_GAME || $BEST_GAME -gt $NUMBER_OF_GUESSES ]]
  then 
    $PSQL "UPDATE users SET best_guess = $NUMBER_OF_GUESSES WHERE username = '$USERNAME'"
  fi
  echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
  exit 0
elif [[ $CURRENT_GUESS -gt $SECRET_NUMBER ]]
then
# User guesses a number too high
NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))
GUESS_MENU "It's lower than that, guess again:"
elif [[ $CURRENT_GUESS -lt $SECRET_NUMBER ]]
then
# User guesses a number too low
NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))
GUESS_MENU "It's higher than that, guess again:"
fi
}
# Initialize game
GAMES_PLAYED=$((GAMES_PLAYED + 1))
NUMBER_OF_GUESSES=0
SECRET_NUMBER=$(( RANDOM % 1000 + 1))
echo "Guess the secret number between 1 and 1000:"
GUESS_MENU ""