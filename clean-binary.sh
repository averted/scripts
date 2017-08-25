#!/bin/bash
# Remove unneccessary / unused files from BIN

# Args
args=("$@")

# Directories to test against
BIN=/usr/bin
SBIN=/usr/sbin

# Files to clean
BIN_FILES=('weblatency.d');
SBIN_FILES=('webpromotion')

# Exit if unknown flag
if [ ! ${#args} -eq 0 ] && [ ${args[0]} != "-r" ]; then
  echo "ERROR: Unknown Flag '${args[0]}'"
  exit
fi

# Functions
function renameFile {
  FILE=$1
  REVERSE=$2

  if [ $REVERSE == "true" ]; then
    if [ -f _$file ]; then
      echo "Moving [ _$file ] to [ $file ]"
      mv ./_$file ./$file
    else
      echo "File [ _$file ] not found!"
    fi
  else
    if [ -f $file ]; then
      echo "Moving [ $file ] to [ _$file ]"
      mv ./$file ./_$file
    else
      echo "File [ $file ] not found!"
    fi
  fi
}

# Main
function renameFiles {
  DIR=$1
  FILES=("${!2}")
  REVERSE="false" && [ ! ${#args} -eq 0 ] && REVERSE="true"

  # Cd into proper directory
  cd $DIR

  # Clean files
  for file in ${FILES[@]}; do
    renameFile $file $REVERSE
  done
}

# Init
renameFiles $BIN BIN_FILES[@]
renameFiles $SBIN SBIN_FILES[@]

exit 0
