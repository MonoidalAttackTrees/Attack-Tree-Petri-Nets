PDFLATEX = pdflatex
# BIBTEX = bibtex
OTT = ott
OTT_FLAGS := -tex_wrap false -tex_show_meta true -picky_multiple_parses false
SKIM := skim_revert.sh
SKIMRevinPath := $(shell command -v $(SKIM) 2> /dev/null)

TexFileName := main
OTTOutputFile := main.tex
OTTPrefix := Ott

Main := $(TexFileName).tex
References := references.bib

PDF := $(TexFileName).pdf

all: pdf
  # This is for my private machine.  It forces my PDF reader to reload.
  # It should not run unless "skim_revert.sh" is in your PATH
  ifdef SKIMRevinPath
	@$(SKIM) $(PDF) &>/dev/null
	@$(SKIM) $(PDF) &>/dev/null
	@$(SKIM) $(PDF) &>/dev/null
  endif

quick : quick-pdf
  # This is for my private machine.  It forces my PDF reader to reload.
  # It should not run unless "skim_revert.sh" is in your PATH.
  ifdef SKIMRevinPath
	@$(SKIM) $(PDF) &>/dev/null
	@$(SKIM) $(PDF) &>/dev/null
	@$(SKIM) $(PDF) &>/dev/null
  endif

pdf : $(PDF)

$(PDF) : main.tex Makefile NotesAttackTreesPetriNets.tex petri.tex
	$(PDFLATEX) -jobname=$(TexFileName) $(OTTOutputFile)
	bibtex $(TexFileName)
	$(PDFLATEX) -jobname=$(TexFileName) $(OTTOutputFile)
	$(PDFLATEX) -jobname=$(TexFileName) $(OTTOutputFile)

clean :
	rm -f *.aux *.dvi *.ps *.log *-ott.tex *-output.tex *.bbl *.blg *.rel *~ *.vtc *.out *.spl *-inc.tex *.pdf
