#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

echo 'Enter your username:'
read USERNAME

USERNAMEFOUND=$($PSQL "select username from usernames where username='$USERNAME';")

if [[ -z $USERNAMEFOUND ]]
then
# not found
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  NEWUSER=$($PSQL "insert into usernames(username) values('$USERNAME');")
else
#user found
#print welcome message
  #generate secret number
  SECRETNUMBER=$(($RANDOM % 1000))
  echo $USERNAMEFOUND : $SECRETNUMBER
  while [[ $GUESS -ne $SECRETNUMBER ]]
  do
    echo 'Guess the secret number between 1 and 1000:'
    read GUESS
    if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then
      #not a number
      echo 'That is not an integer, guess again:'
    fi
  done
  
fi


