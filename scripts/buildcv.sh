#!/bin/bash

SCRIPT_PATH="$(git rev-parse --show-toplevel)"
FILE2CONVERT="`ls ${SCRIPT_PATH}/data/*.tex`"
FILECONVERTEDPATH="${SCRIPT_PATH}/out"
source "${SCRIPT_PATH}/scripts/spinner.sh"

convertPdf()
{
	start_spinner "  -  PDF Build"
	${SCRIPT_PATH}/scripts/convert2pdf.sh ${texfile}
	stop_spinner $? 
}

convertHtml()
{
	start_spinner "  -  HTML Build"
	${SCRIPT_PATH}/scripts/convert2html.sh ${texfile}
	stop_spinner $?
}

showbuildfile()
{
	file="$1"
	woext="${file%.*}"
        echo "--> File Produced \n"
        ls "${SCRIPT_PATH}/out/${woext}"* | tr '\n' '\n'
}


echo "#### Starting all CV Build ####\n"
echo "${FILE2CONVERT}"
echo -e "\n CV are produced in --> ${FILECONVERTEDPATH}"

for texpath in ${FILE2CONVERT}
do
	texfile=$(basename "${texpath}")
	echo -e "#### Starting ${texfile} CV Build ####\n"
	convertPdf
	convertHtml
	showbuildfile ${texfile}
	echo -e "#### finished ${texfile} CV Build ####\n"
done

x-www-browser ${SCRIPT_PATH}/out


