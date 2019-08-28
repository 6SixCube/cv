#!/bin/sh

TEX=${1:-"cv_pierre.force.tex"}
pdffile="${TEX%.*}.pdf"
pdfdir="$(git rev-parse --show-toplevel)/out"


docker run -di --rm -v ${pdfdir}:/pdf bwits/pdf2htmlex pdf2htmlEX --zoom 1.3 ${pdffile}




