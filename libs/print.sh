# Created:
# by Ryan Ogden
# on 1/28/21
# 
# print.sh aims to augment the echo command with prioritization of outputs for debugging.
# Requires that the calling script sets the printPermission variable.

# Sets default globals
printIndentation=0
printPermission=3

# Print errors
print1() {
  if [ ! -z "$printPermission" ]
  then
    if [ $printPermission -ge 1 ]
    then
      printEcho "$@"
    fi
  fi
}

# Print warnings
print2() {
  if [ ! -z "$printPermission" ]
  then
    if [ $printPermission -ge 2 ]
    then
      printEcho "$@"
    fi
  fi
}

# Print info
print3() {
  if [ ! -z "$printPermission" ]
  then
    if [ $printPermission -ge 3 ]
    then
      printEcho "$@"
    fi
  fi
}

# Print debug
print4() {
  if [ ! -z "$printPermission" ]
  then
    if [ "$printPermission" = "4" ]
    then
      printEcho "$@"
    fi
  fi
}

printEcho() {
  local args=("$@")
  local flags=()
  local out=()

  for (( i=0; i<${#args[@]}; i++ ))
  do
    case "${args[i]}" in
      -*)
        flags+=("${args[i]}")
      ;;
      *)
        out+=("${args[i]}")
      ;;
    esac
  done

  if [ ! -z "$printIndentation" ]
  then
    local indentationPrefix=''

    for (( print_j=1; print_j<$printIndentation; print_j++ ))
    do
      indentationPrefix+="\t"
    done

    for (( print_j=0; print_j<${#out[@]}; print_j++ ))
    do
      out[$print_j]=$(echo "${out[print_j]}" | sed "s/^/$indentationPrefix/g")
    done
  fi

  echo ${flags[@]} "${out[@]}"
}

