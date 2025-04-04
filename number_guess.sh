#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

NUMBER_OF_GUESSES=0
SECRET_NUMBER=$(( RANDOM % 1001))
#echo -e "$SECRET_NUMBER\n" 
echo -e "Enter your username:"
read INPUT_USERNAME

RETURNING_USER=$($PSQL "SELECT username FROM users WHERE username='$INPUT_USERNAME'")

if [[ -z $RETURNING_USER ]]
then 
echo "Welcome, $INPUT_USERNAME! It looks like this is your first time here."
$PSQL "INSERT INTO users(username, games_played) VALUES ('$INPUT_USERNAME', 0);"
else
GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$RETURNING_USER'")
BEST_GAME=$($PSQL "SELECT best_guess FROM users WHERE username='$RETURNING_USER'")
echo "Welcome back, $RETURNING_USER! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

GUESS_MENU() {
echo -e "$1"
echo -e "Guess the number between 1 and 1000:"
read CURRENT_GUESS

if ! [[ $CURRENT_GUESS =~ ^[0-9]+$ ]]
  then GUESS_MENU "That is not an integer, guess again:"
elif [[ $CURRENT_GUESS -eq $SECRET_NUMBER ]]
then 
  NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))
  echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
  GAMES_PLAYED=$((GAMES_PLAYED + 1))
  $PSQL "UPDATE users SET games_played = $GAMES_PLAYED WHERE username = '$INPUT_USERNAME'"

  #Set check best guess, update if less than
  if [[ -z $BEST_GAME || $BEST_GAME -gt $NUMBER_OF_GUESSES ]]
  then 
    $PSQL "UPDATE users SET best_guess = $NUMBER_OF_GUESSES WHERE username = '$INPUT_USERNAME'"
  fi
  exit 0
elif [[ $CURRENT_GUESS -gt $SECRET_NUMBER ]]
then
NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))
GUESS_MENU "It's lower than that, guess again:"
elif [[ $CURRENT_GUESS -lt $SECRET_NUMBER ]]
NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))

then GUESS_MENU "It's higher than that, guess again:"
fi
}
GUESS_MENU