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
  #echo $USERNAMEFOUND
  GAMEFOUND=$($PSQL "select username,count(game_id),MIN(guess_count) from games  group by username having  username='$USERNAME';")
  #echo "GAMEFOUND:$GAMEFOUND"
  echo "$GAMEFOUND" | while read USER BAR COUNT BAR MIN
    do
      #print welcome message
      echo "Welcome back, $USER! You have played $COUNT games, and your best game took $MIN guesses." 
    
    done
  
  #generate secret number
  SECRETNUMBER=$(( ( $RANDOM % 1000 ) + 1 ))
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
    else
      #check if secret number is higher than the guess
      if [[ $GUESS -lt $SECRETNUMBER ]]
      then
        echo "It's higher than that, guess again:"
      fi
      #check if secret number is lower than the guess
      if [[ $GUESS -gt $SECRETNUMBER ]]
      then
        echo "It's lower than that, guess again:"
      fi
    fi
  done
  #secret number is guessed
  echo You guessed it in $TRIES tries. The secret number was $SECRETNUMBER. Nice job!
  #insert into table
  NEWGAME=$($PSQL "insert into games(username,guess_count) values('$USERNAME',$TRIES);")
  
fi


