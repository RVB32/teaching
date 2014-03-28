#!/bin/bash

LEARNING_FOLDER="~/learning"

PROMPT_PART1="Looks like you're done! :)"

check_file () {
  ls $1 &> /dev/null
}

function learning_folder_exists () {
  check_file $LEARNING_FOLDER
  if [ "$?" -eq "0" ]; then
    exit 0
  else
    echo 'Make a folder in which you can practice your linux skills'
    exit 0
  fi
}


function add_instructions () {
  $PROMPT_PART1=learning_folder_exists
}

BASIC_PROMPT="[\u@\h \w]"
PS1="\n/ \$PROMPT_PART1\n\\ $BASIC_PROMPT"

