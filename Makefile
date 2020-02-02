# Create various document formats from the markdown

PANDOC=pandoc

OUTPATH=www/files
OUTPUTNAME=MatthewDavidLitwin

.PHONY: build
build: build-html
	$(PANDOC) -r gfm -w docx --output=$(OUTPATH)/$(OUTPUTNAME).docx README.md
	$(PANDOC) -r gfm -w pdf --output=$(OUTPATH)/$(OUTPUTNAME).pdf README.md

.PHONY: build-html
build-html: build-html	
	$(PANDOC) -r gfm -w html5+smart --output=tmp.html README.md
	node ./bin/makehtml.js template.html tmp.html > www/index.html
	rm tmp.html
