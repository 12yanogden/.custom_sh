# Created:
# by Ryan Ogden
# on 9/28/20
#
# Builds a pass or fail status bar

include "commands"
include "statusBar"

pass() {
  # Exits if printPermission is set to quiet
  if [ $printPermission == "0" ]
  then
    return 0
  fi

  local args=("$@")
  local colorFlagIndex=''

  for (( i=0; i<${#args[@]}; i++ ))
  do
    if [ "${args[i]}" = "-c" ]
    then
      colorFlagIndex=$i
      break
    fi
  done

  if [ ! -z "$colorFlagIndex" ]
  then
    unset 'args[colorFlagIndex]'
    statusBar "${args[@]}" -s "PASS" -c "$green"
  else
    statusBar "${args[@]}" -s "PASS"
  fi
}

fail() {
  # Exits if printPermission is set to quiet
  if [ $printPermission == "0" ]
  then
    return 0
  fi

  local args=("$@")
  local colorFlagIndex=''

  for (( i=0; i<${#args[@]}; i++ ))
  do
    if [ "${args[i]}" = "-c" ]
    then
      colorFlagIndex=$i
      break
    fi
  done

  if [ ! -z "$colorFlagIndex" ]
  then
    unset 'args[colorFlagIndex]'
    statusBar "${args[@]}" -s "FAILED" -c "$red"
  else
    statusBar "${args[@]}" -s "FAILED"
  fi
}