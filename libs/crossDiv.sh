# Created:
# by Ryan Ogden
# on 9/28/20
#
# Builds a divider with dashed arms and crosses on either side
#
# +--------------------- Example Divider ---------------------+

include "div"

crossDiv() {
  # Exits if printPermission is set to quiet
  if [ $printPermission == "0" ]
  then
    return 0
  fi

  div "$@" -oe "+"
}