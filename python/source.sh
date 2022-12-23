#!/usr/local/bin/bash
commands_dir="$(dirname "${BASH_SOURCE[0]}")/commands"

# ------------------------------- Div Variants -------------------------------- #
div() { python $commands_dir/div.py "$@" ; }
crossdiv() { python $commands_dir/div.py "$@" '--edges' '+' '--arms' '-' ; }
hashdiv() { python $commands_dir/div.py "$@" '--left-edge' '# ' '--right-edge' ' #' ; }
cdiv() { python $commands_dir/div.py "$@" '--left-edge' '// ' '--right-edge' ' //' ; }

# ------------------------------ Block Variants ------------------------------- #
block() { python $commands_dir/block.py "$@" ; }
crossblock() { python $commands_dir/block.py "$@" '--w-edge' '| ' '--e-edge' ' |' '--corners' '+' '--h-edges' '-' ; }
hashblock() { python $commands_dir/block.py "$@" '--w-edge' '# ' '--e-edge' ' #' '--h-edges' '-' ; }
cblock() { python $commands_dir/block.py "$@" '--w-edge' '// ' '--e-edge' ' //' '--h-edges' '-' ; }
cblock2() { python $commands_dir/block.py "$@" '--v-edges' '│' '--h-edges' '─' '--nw-corner' '/*' '--ne-corner' '*\' '--sw-corner' '\*' '--se-corner' '*/' ; }
cleanblock() { python $commands_dir/block.py "$@" '--v-edges' '' '--h-edges' '─' '--nw-corner' '┎' '--ne-corner' '┒' '--sw-corner' '┖' '--se-corner' '┚' ; }
cornerblock() { python $commands_dir/block.py "$@" '--v-edges' '' '--h-edges' ' ' '--nw-corner' '┎' '--ne-corner' '┒' '--sw-corner' '┖' '--se-corner' '┚' ; }

# magicblock
# ╭─ ⋅𖥔⋅ ── ✶ ── ⋅𖥔⋅ ─╮

# ╰─ ⋅𖥔⋅ ── ✶ ── ⋅𖥔⋅ ─╯

# ------------------------------ Status Variants ------------------------------ #
pass() { python $commands_dir/pass_status.py "$@" ; }
fail() { python $commands_dir/fail_status.py "$@" ; }

# ---------------------------- Print Font Variants ---------------------------- #
shadow() { python $commands_dir/print_font.py "shadow" "$@" ; }
alpha() { python $commands_dir/print_font.py "alpha" "$@" ; }

# ----------------------------------------------------------------------------- #
#                                                                               #
#                                Legacy Functions                               #
#                                                                               #
# ----------------------------------------------------------------------------- #
alias ll="ls -lh"
alias la="ls -lha"

# -------------------------------- Navigation --------------------------------- #
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
   esac
}

# ------------------------------- MacOS Custom -------------------------------- #
# code() { 
#   VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*
# }

# Add Visual Studio Code (code)
# export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# ------------------------------ SDK Management ------------------------------- #
upgrade() {
  case "$1" in
    flutter)
      /Users/ryan/SDKs/.upgrade_flutter.sh
    ;;
  esac
}
