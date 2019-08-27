#!/bin/sh

pdffile=cv_pierre.force.pdf
pdfdir="$(git rev-parse --show-toplevel)/out"


docker run -di --rm -v ${pdfdir}:/pdf bwits/pdf2htmlex pdf2htmlEX --zoom 1.3 ${pdffile}




