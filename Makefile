.PHONY: all main landscape portrait clean FORCE

POSTERS := poster-landscape poster-portrait
PDFS := $(addsuffix .pdf,$(POSTERS))

all main: $(PDFS)

landscape: poster-landscape.pdf

portrait: poster-portrait.pdf

%.pdf: %.tex FORCE
	latexmk -pdflatex='lualatex -interaction nonstopmode' -pdf $<

clean:
	latexmk -pdf -C $(addsuffix .tex,$(POSTERS))
