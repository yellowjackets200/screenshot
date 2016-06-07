#!/usr/bin/env bash
####################################################################################
##
## Script that uses the utility for getting screenshoots from merchants' websites.
##
## INPUT
##    - URL
##
## OUTPUT:
##    - Return code: 0 success, ¬0 otherwise 
##
#####################################################################################

BIN="node"
SCRIPT="screenshot_with_webshot.js"
TAB="   ==SHELL "

# Input validation
if [ "$#" -ne 1 ]; then
   echo "${TAB}Usage: script_name merchant_url"
   exit 1
fi

URL=${1}
NOW=$(date +"%Y%m%d-%H%M%S")
IMAGE_FILE="img_${NOW}.png"

CMD="${BIN} ${SCRIPT} ${URL} ${IMAGE_FILE}"
echo "${TAB}Executing: ${CMD}"

# Library call
eval "${CMD}"
RETCODE=${?}

# Check if the image file was created correctly, despite success code from library
if [ ${RETCODE} -eq 0 ]; then
   if [ -s ${IMAGE_FILE} ]; then
      echo "${TAB}Verifying image... OK!"
   else
      echo "${TAB}Verifying image... NOT FOUND!"
      RETCODE=1
   fi
fi

echo "${TAB}Exit code: ${RETCODE}"

exit ${RETCODE}
