#!/bin/bash

LEARNING_FOLDER=~/learning

PROMPT="Looks like you're done! :)"

function learning_folder_exists () {
  if [ -d $LEARNING_FOLDER ]
  then
    echo ""
  else
    echo 'Make a folder in which you can practice your linux skills'
  fi
}

function touched_files_exist () {
  if [ -f ~/learning/a ];   then a='t'; else a='f' ; fi
  if [ -f ~/learning/b ];   then b='t'; else b='f' ; fi
  if [ -h ~/learning/c/d ]; then d='t'; else d='f' ; fi

  case "$a$b$d" in
    ttt) echo 'Please remove file b' ;;
    ttf) echo '' ;; # We're waiting for a folder c Defering to other instruction
    tft) echo '' ;; # We're done here
    tff) echo 'Please create a file named b inside ~/learning' ;;
    ftt) echo 'Please create a file named a inside of ~/learning' ;;
    fft) echo 'Please create a file named a inside of ~/learning' ;;
    ftf) echo 'Please create a file named a inside of ~/learning' ;;
    fff) echo 'Please create two files named a and b inside of the learning folder' ;;
     *) #error
       exit 1
  esac
}

function symbolic_links () {
  if [ -d ~/learning/c ];   then c='t'; else c='f' ; fi
  if [ -h ~/learning/c/d ]; then d='t'; else d='f' ; fi

  case "$c$d" in
    tt) echo '';; # we're done here
    tf) echo 'Please create a symbolic link of a to d inside of folder c' ;;
    ft) echo 'How did you even do this?' ;;
    ff) echo 'Please create a folder named c inside of the learning folder' ;;
     *) # error
       exit 1
esac

}



function add_instructions () {

  tmp=$(symbolic_links)
  if [ -n "$tmp" ]; then PROMPT=$tmp; fi

  tmp=$(touched_files_exist)
  if [ -n "$tmp" ]; then PROMPT=$tmp; fi

  tmp=$(learning_folder_exists)
  if [ -n "$tmp" ]; then PROMPT=$tmp; fi

  # Then finally...
  echo $PROMPT
}

BASIC_PROMPT="[$(tput setaf 4)\u@\h \w$(tput sgr0)]"
PS1="\n$(tput setaf 2)\$(add_instructions)$(tput sgr0)\n$BASIC_PROMPT "

