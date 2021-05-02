# Created:
# by Ryan Ogden
# on 9/28/20
#
# Sources all other script libraries, records dependant scripts, and eliminates source loops.

include() {
  local name="$1"
  local functions=("block" "commands" "crossBlock" "crossDiv" "div" "hashBlock" "hashDiv" "pass-fail" "print" "statusBar")
  declare -A libraries=([crossStandard]="crossBlock crossDiv pass-fail")
  local rootPath="$(dirname "${BASH_SOURCE[0]}")"

  for function in ${functions[@]}
  do
    if [ "$name" == "$function" ]
    then
      source_sourceIfNotSourced "$rootPath/$function.sh"
      break
    fi
  done

  for library in "${!libraries[@]}"
  do
    if [ "$name" = "$library" ]
    then
      local libFunctions=(${libraries[$library]})

      for libFunction in ${libFunctions[@]}
      do
        include $libFunction
      done
    fi
  done
}

# Sources the script given if it has not been sourced
source_sourceIfNotSourced() {
    local isSourced="0"

    for bashSource in "${BASH_SOURCE[@]}"
    do
      if [ "$bashSource" = "$1" ]
      then
        isSourced="1"
      fi
    done

    if [ "$isSourced" -eq "0" ]
    then
      source "$1"
    fi
}

# Records dependant scripts
source_recordDependant() {
  local callingScript="$( cd "$( dirname "$0" )" && pwd )/$(basename "$0")"
  local dependantScriptRecord="$(dirname "${BASH_SOURCE[0]}")/dependantScripts.txt"
  local dependantScripts=()
  local isRecordedAsDependant=0

  # Reads dependant script paths to dependantScripts
  filename=$dependantScriptRecord
  n=1
  while read line
  do
    dependantScripts+=("$line")
    n=$((n+1))
  done < $filename

  # Determines if callingScript has been recorded as a dependant script
  for dependantScript in "${dependantScripts[@]}"
  do
    if [ "$callingScript" = "$dependantScript" ]
    then
      isRecordedAsDependant=1
      break
    fi
  done

  # If callingScript has not been recorded as a dependant script, this records callingScript
  if [ "$isRecordedAsDependant" = "0" ]
  then
    echo $callingScript >> $dependantScriptRecord
  fi
}

if [ "$0" != "-bash" ]
then
  source_recordDependant
fi