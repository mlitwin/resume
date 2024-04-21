# Create various document formats from the markdown

PANDOC=pandoc

OUTPATH=docs/files
OUTPUTNAME=MatthewDavidLitwin

.PHONY: build
build: build-html
	$(PANDOC) -r gfm -w docx --output=$(OUTPATH)/$(OUTPUTNAME).docx README.md
	$(PANDOC) -r gfm -w pdf --output=$(OUTPATH)/$(OUTPUTNAME).pdf README.md

.PHONY: build-html
build-html: build-html	
	$(PANDOC) -r gfm -w html5+smart --output=tmp.html README.md
	node ./bin/makehtml.js template.html tmp.html > docs/index.html
	rm tmp.html

.PHONY: serve
serve:
	php -S 0.0.0.0:4000 -t ./docs
