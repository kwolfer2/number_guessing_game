#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET_NUMBER=$(( RANDOM % 1001))
echo -e "$SECRET_NUMBER\n" 
echo -e "Enter your username:"
read INPUT_USERNAME

RETURNING_USER=$($PSQL "SELECT username FROM users WHERE username='$INPUT_USERNAME'")

if [[ -z $RETURNING_USER ]]
then 
echo "Welcome, $INPUT_USERNAME! It looks like this is your first time here."
$PSQL "INSERT INTO users(username, games_played, best_guess) VALUES ('$INPUT_USERNAME', 0, 0);"
else
GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$RETURNING_USER'")
BEST_GAME=$($PSQL "SELECT best_guess FROM users WHERE username='$RETURNING_USER'")
echo "Welcome back, $RETURNING_USER! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

GUESS_MENU() {
echo -e "Guess the number between 1 and 1000:"
read CURRENT_GUESS

if [[ $CURRENT_GUESS -eq $SECRET_NUMBER ]]
then echo "YOU WIN!"
$PSQL "INSERT INTO users(games_played) VALUES ($GAMES_PLAYED + 1) WHERE username = '$INPUT_USERNAME'"
elif [[ $CURRENT_GUESS -gt $SECRET_NUMBER ]]
then
GUESS_MENU "It's lower than that, guess again:"
elif [[ $CURRENT_GUESS -lt $SECRET_NUMBER ]]
then GUESS_MENU "It's higher than that, guess again:"
fi
}
GUESS_MENU