#!/bin/sh

pdffile=cv_pierre.force.pdf
pdfdir="/home/pierre/PERSO/CV/out"


docker run -ti --rm -v ${pdfdir}:/pdf bwits/pdf2htmlex pdf2htmlEX --zoom 1.3 ${pdffile}




