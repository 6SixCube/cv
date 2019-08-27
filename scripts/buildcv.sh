#!/bin/sh


SCRIPT_PATH="$(git rev-parse --show-toplevel)"

${SCRIPT_PATH}/scripts/convert2pdf.sh 
${SCRIPT_PATH}/scripts/convert2html.sh 
