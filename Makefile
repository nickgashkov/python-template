.PHONY: flake sort po mo apidocs

export PARDIR = $(shell pwd)

APIDOC_OUTPUT = $(PARDIR)/src/docs/source/apidocs
APIDOC_SOURCES = $(PARDIR)/src/docs/source/apidocs
APIDOC_EXCLUDE = $(PARDIR)/src/settings $(PARDIR)/src/tests

flake:
	flake8 $(PARDIR)

sort:
	isort -rc $(PARDIR)

po:
	$(MAKE) po -C $(PARDIR)/src/locale/

mo:
	$(MAKE) mo -C $(PARDIR)/src/locale/

apidocs:
	sphinx-apidoc -f -o $(APIDOC_OUTPUT) -f $(APIDOC_SOURCES) $(APIDOC_EXCLUDE)
	$(MAKE) html -C $(PARDIR)/src/docs/
