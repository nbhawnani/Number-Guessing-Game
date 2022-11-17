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
  echo $USERNAMEFOUND : $RANDOM
fi


