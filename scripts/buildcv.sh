#!/bin/bash

SCRIPT_PATH="$(git rev-parse --show-toplevel)"
FILE2CONVERT="`ls ${SCRIPT_PATH}/data/*.tex | tr '\n' '\n'`"
FILECONVERTEDPATH="${SCRIPT_PATH}/out"
source "${SCRIPT_PATH}/scripts/spinner.sh"

convertPdf()
{
	start_spinner "  -  PDF Build"
	${SCRIPT_PATH}/scripts/convert2pdf.sh ${texfile} > /dev/null 2>&1
	stop_spinner $?
}

convertHtml()
{
	start_spinner "  -  HTML Build"
	${SCRIPT_PATH}/scripts/convert2html.sh ${texfile} > /dev/null 2>&1
	stop_spinner $?
}

showbuildfile()
{
	file="$1"
	woext="${file%.*}"
        echo -e "\n--> File Produced :"
        ls -l "${SCRIPT_PATH}/out/${woext}"* | sed "s#^.*./##"
}


echo -e "\n############ Starting all CV Build ############\n\n -  File(s) found :"
echo "`ls ${SCRIPT_PATH}/data/*.tex | tr '\n' '\n'`"
echo -e "\n CV are produced in :"
echo "${FILECONVERTEDPATH}" | tr '\n' '\n'

for texpath in ${FILE2CONVERT}
do
	texfile=$(basename "${texpath}")
	echo -e "#### Starting ${texfile} CV Build ####\n"
	convertPdf
	convertHtml
	showbuildfile ${texfile}
	echo -e "\n#### finished ${texfile} CV Build ####\n"
done

echo -e "\n############ Finished all CV Build ############\n\n -  File(s) produced :"
ls -I README.md -l ${SCRIPT_PATH}/out/




if [ -z $1 ];then
	exit
else
	x-www-browser ${SCRIPT_PATH}/$1 &
fi
