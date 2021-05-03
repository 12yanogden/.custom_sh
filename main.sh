source "$(dirname "${BASH_SOURCE[0]}")"/libs/source.sh
include "all"

alias ll="ls -lh"
alias la="ls -lha"

#------------------------------------- Navigation --------------------------------------#
alias home="cl ${HOME}"

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
