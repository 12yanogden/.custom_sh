# Created:
# by Ryan Ogden
# on 12/29/20
#
# crossBlock.sh provides functions to build a crossBlock around text
#
# +-----------------------------------------------------------+
# |                                                           |
# |                      Example Block                        |
# |                                                           |
# +-----------------------------------------------------------+

include "commands"
include "block"

crossBlock() {
  # Exits if printPermission is set to quiet
  if [ $printPermission == "0" ]
  then
    return 0
  fi

  block "$@" -c '+' -se '|' -tbe '-'
}