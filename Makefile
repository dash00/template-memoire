# @Author: Jérémy Coatelen
# @Date:   2015-05-05 19:28:31
# @Last Modified by:   dash
# @Last Modified time: 2015-05-05 19:46:50



# Paramètres du Makefile :
# nom du projet
TEX=root
# compilateur latex
CC=pdflatex

# aide :
help:
	@echo
	@echo " Compilation du mémoire, regles :"
	@echo
	@echo " help  	: afficher cette aide"
	@echo " simple  : compiler une seule fois"
	@echo " double  : compilation 'simple' deux fois"
	@echo " bib  	: bibtex seul"
	@echo " glo  	: makeglossaries seul"
	@echo " all     : compilation totale (double -> bib -> glo -> double)"
	@echo " purge   : nettoyage"
	@echo

# compilation simple
simple: $(TEX).tex
	$(CC) $(TEX)

double: $(TEX).tex
	$(CC) $(TEX)
	$(CC) $(TEX)
	
bib: $(TEX).tex
	@bibtex $(TEX)
	
glo: $(TEX).tex
	@makeglossaries $(TEX)

# compilation complete, on passe plusieurs fois pour les references croisee plus bibtex pour la
# biblio
all: $(TEX).tex
	$(CC) $(TEX)
	$(CC) $(TEX)
	@bibtex $(TEX)
	@makeglossaries $(TEX)
	$(CC) $(TEX)
	$(CC) $(TEX)
	@echo
	@echo 
	@echo "fin ;)"
	@echo

# efface les fichiers .log .aux .toc .bbl .blg 
.PHONY: purge
purge:
	@rm -vf *.aux *.acn *.alg *.equ *.tdo *.ist *.acr *.bbl *.blg $(TEX).log $(TEX).out $(TEX).toc $(TEX).mtc* $(TEX).lof $(TEX).lot $(TEX).gls $(TEX).glg $(TEX).glo $(TEX).loa $(TEX).xdy *.blg $(TEX).maf
	@echo "done"

