.phony = all, clean

RMD=$(wildcard *.Rmd)
HTML=$(patsubst %.Rmd, docs/%.html, $(RMD))

all: $(HTML) docs/index.html 
	firefox docs/index.html


clean:
	rm -rf docs/


docs/%.html: %.*md
	Rscript -e 'rmarkdown::render_site("$<")'

