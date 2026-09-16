#!/bin/bash

name="design-thinking"
dir="$(pwd | sed -E 's|^.*/||')"
outdir="/tmp/$dir"

do_pdflatex() {
	pdflatex \
		--shell-escape \
		--output-directory "$outdir" \
		$name.tex
}

do_biblatex() {
	biber \
		--output-directory "$outdir" \
		$name
}

if [[ ! -a "$outdir" ]]
then
	mkdir -p "$outdir" 
fi

case $1 in
	--all|-a)
		do_pdflatex
		do_biblatex
		do_pdflatex
		;;

	*)
		do_pdflatex
esac
