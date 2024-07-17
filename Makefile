# Minimal makefile for Latex protocol template

# You can set these variables from the command line, and also
# from the environment.
OUTDIR ?= build
DOC ?= cheatsheet
PDF ?= CheatSheet

XELATEX = -interaction=nonstopmode -synctex=1 -file-line-error -output-directory=$(OUTDIR) -f
LATEXMK = -xelatex $(XELATEX)
TEXLIVEONFLY = --compiler=xelatex --arguments="$(XELATEX)"

.PHONY: help Makefile
help:

pdf:
	@echo "Compiling $(DOC).tex"
	@latexmk $(LATEXMK) $(DOC).tex

listen:
	@echo "Listening on filechanges for $(DOC).tex"
	@latexmk $(LATEXMK) -pvc $(DOC).tex

dep:
	@echo "Install missing dependencies"
	@texliveonfly $(TEXLIVEONFLY) $(DOC).tex

pkg:
	@make pdf
	@cp $(OUTDIR)/$(DOC).pdf ./$(PDF).pdf

clean:
	@rm -R $(OUTDIR)
	@make pdf
