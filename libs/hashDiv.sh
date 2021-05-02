# Created:
# by Ryan Ogden
# on 9/28/20
#
# Builds a divider with dashed arms and hashes on either side
#
# #--------------------- Example Divider ---------------------#

include "div"

hashDiv() {
  # Exits if printPermission is set to quiet
  if [ $printPermission == "0" ]
  then
    return 0
  fi

  div "$@" -oe "#"
}