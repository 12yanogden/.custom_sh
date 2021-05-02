# Created:
# by Ryan Ogden
# on 9/28/20
#
# Builds a hashBlock around text
#
# #-----------------------------------------------------------#
# #                                                           #
# #                      Example Block                        #
# #                                                           #
# #-----------------------------------------------------------#

include "commands"
include "block"

hashBlock() {
  # Exits if printPermission is set to quiet
  if [ $printPermission == "0" ]
  then
    return 0
  fi

  block "$@" -c '#' -se '#' -tbe '-'
}