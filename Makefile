BASE=redborder-install-guide
OUTDIR=docs
MAIN=$(BASE).adoc
CHAPTERS=chapters

.PHONY: es-html
es-html: $(SOURCES) styles/$(CSS)
	asciidoctor es-ES_$(MAIN) -a stylesheet=./styles/rubygems.css --attribute tabsize=4 -o $(OUTDIR)/es-ES/index.html
	cp -r $(CHAPTERS)/images $(OUTDIR)/es-ES

.PHONY: es-pdf
es-pdf: $(SOURCES) styles/$(CSS)
	asciidoctor-pdf es-ES_$(MAIN) --attribute tabsize=4 -o $(OUTDIR)/es-ES/$(BASE).pdf

.PHONY: clean
clean:
	-rm -rf $(OUTDIR)/*

print-%  : ; @echo $* = $($*)
