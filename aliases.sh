alias ll="ls -lh"
alias la="ls -lha"

#------------------------------------------------------- GoTo -------------------------------------------------------#
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
    lab1)
    ;;
   esac
}
