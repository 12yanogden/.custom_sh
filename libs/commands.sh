# Created:
# by Ryan Ogden
# on 9/28/20
#
# commands.sh is meant to house often used statements.

include "print"

# Use with print3 -e for printing bold text
bold=$(tput bold)
normal=$(tput sgr0)

# Use with print3 -e for printing in color
red='\033[0;31m'
green='\033[0;32m'
blue='\033[0;34m'
cyan='\033[0;36m'
lightRed='\033[1;31m'
lightGreen='\033[1;32m'
yellow='\033[1;33m'
lightBlue='\033[1;34m'
lightPurple='033[1;35m'
noColor='\033[0m'

skip() {
  skipCount=${1:-1}

  for i in $(seq $skipCount)
  do
    print3 ""
  done
}

space() {
  local spaceCount=${1:-1}

  for (( i=0; i<$spaceCount; i++ ))
  do
    echo -n " "
  done
}

repeat() {
  local chars="$1"
  local count=$2
  local out=''

  # Assembles repeated string
  for i in $(seq $count)
  do
    out+="$chars"
  done

  # Echo return
  echo -en "$out"
}

divide() {
  local dividend=''
  local divisor=2
  local includeRemainder=0
  local quotient=0

  for arg in "$@"
  do
    case $arg in
      -r|--remainder)
        includeRemainder=1
        shift
      ;;
      *)
        if [ -z "$dividend" ]
        then
          dividend=$1
        else
          divisor=$1
        fi
        shift
      ;;
    esac
  done

  quotient=$(($dividend / $divisor))
  
  if [ "$includeRemainder" = "1" ]
  then
    local remainder=$(($dividend % $divisor))
    
    quotient=$(($quotient + $remainder))
  fi

  echo $quotient
}