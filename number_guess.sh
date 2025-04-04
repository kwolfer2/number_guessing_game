#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

NUMBER_OF_GUESSES=0
SECRET_NUMBER=$(( RANDOM % 1000 + 1))
echo "Enter your username:"
read INPUT_USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$INPUT_USERNAME'")

if [[ -z $USER_ID ]]
then 
  $PSQL "INSERT INTO users(username, games_played) VALUES ('$INPUT_USERNAME', 0);"
  USERNAME=$INPUT_USERNAME
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  USERNAME=$($PSQL "SELECT username FROM users WHERE user_id = $USER_ID")
  USERNAME=$(echo $USERNAME | xargs)
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_guess FROM users WHERE username='$USERNAME'")
  GAMES_PLAYED=$(echo $GAMES_PLAYED | xargs)
  BEST_GAME=$(echo $BEST_GAME | xargs)
  if [[ -z $BEST_GAME ]]; then
    BEST_GAME=0
  fi
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

GUESS_MENU() {
if [[ ! -z $1 ]]
then
echo "$1"
fi

echo "Guess the secret number between 1 and 1000:"
read CURRENT_GUESS

if ! [[ $CURRENT_GUESS =~ ^[0-9]+$ ]]
  then GUESS_MENU "That is not an integer, guess again:"
elif [[ $CURRENT_GUESS -eq $SECRET_NUMBER ]]
then 
  NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))
  echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
  GAMES_PLAYED=$((GAMES_PLAYED + 1))
  $PSQL "UPDATE users SET games_played = $GAMES_PLAYED WHERE username = '$USERNAME'"
  if [[ -z $BEST_GAME || $BEST_GAME -gt $NUMBER_OF_GUESSES ]]
  then 
    $PSQL "UPDATE users SET best_guess = $NUMBER_OF_GUESSES WHERE username = '$USERNAME'"
  fi
  exit
elif [[ $CURRENT_GUESS -gt $SECRET_NUMBER ]]
then
NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))
GUESS_MENU "It's lower than that, guess again:"
elif [[ $CURRENT_GUESS -lt $SECRET_NUMBER ]]
then
NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))
GUESS_MENU "It's higher than that, guess again:"
fi
}
GUESS_MENU ""