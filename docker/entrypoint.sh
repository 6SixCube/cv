#!/bin/sh

latex_src=${TEXFILE:-"cv_pierre.force.tex"}
latex_path="data/${latex_src}"
dst_out="/home/cv/out"

/usr/bin/pdflatex -halt-on-error -interaction=nonstopmode -output-directory=${dst_out} ${latex_path} > /dev/null
