BASE=redborder-install-guide
OUTDIR=docs
MAIN=$(BASE).adoc
CHAPTERS=chapters

.PHONY: html
html: $(SOURCES) styles/$(CSS)
	asciidoctor $(MAIN) -a stylesheet=./styles/rubygems.css --attribute tabsize=4 -o $(OUTDIR)/index.html
	cp -r $(CHAPTERS)/images $(OUTDIR)

.PHONY: pdf
pdf: $(SOURCES) styles/$(CSS)
	asciidoctor-pdf $(MAIN) --attribute tabsize=4 -o $(OUTDIR)/$(BASE).pdf

.PHONY: clean
clean:
	-rm -rf $(OUTDIR)/*

print-%  : ; @echo $* = $($*)
