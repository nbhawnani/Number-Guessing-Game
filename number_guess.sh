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
  TRIES=0
  while [[ $GUESS -ne $SECRETNUMBER ]]
  do
    echo 'Guess the secret number between 1 and 1000:'
    read GUESS
    TRIES=$((TRIES+1))
    if [[ ! $GUESS =~ ^[0-9]+$ ]]
    then
      #not a number
      echo 'That is not an integer, guess again:'
    fi
  done
  #secret number is guessed
  echo You guessed it in $TRIES tries. The secret number was $SECRETNUMBER. Nice job!
  #insert into table
  #NEWUSER=$($PSQL "insert into usernames(username) values('$USERNAME');")
  
fi


