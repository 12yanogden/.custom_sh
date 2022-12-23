source "$(dirname "${BASH_SOURCE[0]}")"/globals.sh
source "$(dirname "${BASH_SOURCE[0]}")"/debug/source.sh
include "all"

alias ll="ls -lh"
alias la="ls -lha"

#------------------------------------- Navigation --------------------------------------#
alias home="cl ${HOME}"
alias schizo="ssh ogden9@schizo.cs.byu.edu"

cl() {
  new_directory="$*";

  if [ $# -eq 0 ]
  then
      new_directory=${HOME};
  fi

  builtin cd "${new_directory}" && ls -lh
}

gt() {
  case $1 in
    home)
      cl ${HOME}
      shift
    ;;
    web)
      cl "/var/www"
      shift
    ;;
   esac
}

#-------------------------------------- Notation ---------------------------------------#
cDiv() {
  # Exits if printPermission is set to quiet
  if [ $printPermission == "0" ]
  then
    return 0
  fi

  if [ "$os" == "linux" ]; then
    div "$@" -n -oe "//"
  elif [ "$os" == "macOS" ]; then
    div "$@" -n -oe "//" | pbcopy
  fi
}

cBlock() {
  # Exits if printPermission is set to quiet
  if [ $printPermission == "0" ]
  then
    return 0
  fi

  if [ "$os" == "linux" ]; then
    block "$@" -n -se '//' -c '//' -tbe '-'
  elif [ "$os" == "macOS" ]; then
    block "$@" -n -se '//' -c '//' -tbe '-' | pbcopy
  fi
}

#------------------------------------ MacOS Custom -------------------------------------#
code() { 
  VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*
}

#------------------------------------ SDK Managment ------------------------------------#
upgrade() {
  case "$1" in
    flutter)
      /Users/ryan/SDKs/.upgrade_flutter.sh
    ;;
  esac
}