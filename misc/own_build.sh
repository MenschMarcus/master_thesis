#!/bin/bash

cd ../chapter/

# move all latex stuff back to original folder to compile latex document to pdf
mv ../.stuff/* .

# include bibliography and compile latex to pdf

pdflatex 0-main.tex
bibtex 0-main.aux
pdflatex 0-main.tex
pdflatex 0-main.tex

# move all latex stuff to hidden stuff folder
mv *.aux ../.stuff/
mv *.log ../.stuff/
mv *.lot ../.stuff/
mv *.lof ../.stuff/
mv *.blg ../.stuff/
mv *.out ../.stuff/
mv *.toc ../.stuff/
mv *.bbl ../.stuff/
mv *.fdb_latexmk ../.stuff/

# get final pdf in root folder
mv 0-main.pdf ../Thesis.pdf

# open / update final pdf
evince ../Thesis.pdf &
