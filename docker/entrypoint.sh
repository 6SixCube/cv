#!/bin/sh

latex_src="data/cv_pierre.force.tex"
dst_out="/home/cv/out"


/usr/bin/pdflatex -output-directory=${dst_out} ${latex_src}
