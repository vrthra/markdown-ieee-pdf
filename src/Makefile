exe=../ext
bib=paper.bib
csl=req/ieee.csl
templ=req/ieee_conf.tex
extractbib=$(exe)/extractbib
LATEXOPT=-quiet
abstract=abstract.tex
build=../build

main: slow

$(build):
	mkdir -p $(build)
	cp req/IEEE* $(build)

tex: $(build)/paper.tex

native:
	 pandoc -t native paper.md

json:
	 pandoc -t json paper.md

$(build)/title.tex: meta/title.md
	cat meta/title.md > $(build)/title.tex

$(build)/keys.tex: meta/keys.md
	cat meta/keys.md > $(build)/keys.tex

$(build)/authors.tex: meta/authors-ieee.tex
	cat meta/authors-ieee.tex > $(build)/authors.tex

$(build)/ieee_jrnl.tex: req/ieee_jrnl.tex
	cat req/ieee_jrnl.tex > $(build)/ieee_jrnl.tex

$(build)/paper.bib: read.md
	$(extractbib) read.md > $(build)/paper.bib

$(build)/abstract.tex: meta/abstract.md
	pandoc meta/abstract.md -t latex > $(build)/abstract.tex

$(build)/paper.tex: paper.md $(build)/paper.bib $(build)/authors.tex $(build)/title.tex $(build)/keys.tex
	pandoc paper.md --biblatex --bibliography=$(build)/paper.bib -t latex | sed -e 's/autocite{/cite{/g' -e 's/autocite\[/cite\[/g' > $(build)/paper.tex

$(build)/ieee_jrnl.pdf: $(build)/ieee_jrnl.tex $(build)/paper.tex $(build)/paper.bib $(build)/abstract.tex
	cd $(build); latexmk $(LATEXOPT) -CF -pdf ieee_jrnl.tex

slow: $(build)/ieee_jrnl.pdf

