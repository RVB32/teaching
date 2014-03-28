#!/bin/bash

PROMPT="Looks like you're done! :)"

function learning_folder_exists () {
  if [ -d $LEARNING_FOLDER ]
  then
    echo ""
  else
    echo 'Make a folder called learning in your home directory where you can practice your linux skills'
  fi
}

function touched_files_exist () {
  if [ -f ~/learning/A ];   then A='t'; else A='f' ; fi
  if [ -f ~/learning/B ];   then B='t'; else B='f' ; fi
  if [ -h ~/learning/C/D ]; then D='t'; else D='f' ; fi

  case "$A$B$D" in
    ttt) echo 'Please remove file B' ;;
    ttf) echo '' ;; # We're waiting for a folder c Defering to other instruction
    tft) echo '' ;; # We're done here
    tff) echo 'Please create a file named B inside ~/learning' ;;
    ftt) echo 'Please create a file named A inside of ~/learning' ;;
    fft) echo 'Please create a file named A inside of ~/learning' ;;
    ftf) echo 'Please create a file named A inside of ~/learning' ;;
    fff) echo 'Please create two files named A and B inside of the learning folder' ;;
     *) #error
       exit 1
  esac
}

function symbolic_links () {
  if [ -d ~/learning/C ];   then C='t'; else C='f' ; fi
  if [ -h ~/learning/C/D ]; then D='t'; else D='f' ; fi

  case "$C$D" in
    tt) echo '';; # we're done here
    tf) echo 'Please create a symbolic link of A to D inside of folder C' ;;
    ft) echo 'How did you even do this?' ;;
    ff) echo 'Please create a folder named C inside of the learning folder' ;;
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

