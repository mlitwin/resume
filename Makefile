# Create various document formats from the markdown

PANDOC=pandoc

OUTPUTNAME=MatthewDavidLitwin

.PHONY: build
build: build-html
	$(PANDOC) -r gfm -w docx --output=$(OUTPUTNAME).docx README.md
	$(PANDOC) -r gfm -w pdf --output=$(OUTPUTNAME).pdf README.md

.PHONY: build-html
build-html: build-html	
	$(PANDOC) -r gfm -w html5+smart --output=temp.html README.md
	node ./bin/makehtml.js temp.html > www/index.html
	rm temp.html
