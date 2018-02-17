.PHONY: flake sort po mo apidocs

DEFAULT_NAME = src
NAME ?= $(DEFAULT_NAME)

export PARDIR = $(shell pwd)
export SRCDIR = $(PARDIR)/$(NAME)

APIDOC_OUTPUT = $(SRCDIR)/docs/source/_apidocs
APIDOC_SOURCES = $(SRCDIR)/docs/source/_apidocs
APIDOC_EXCLUDE = $(SRCDIR)/settings $(SRCDIR)/tests

flake:
	flake8 $(PARDIR)

sort:
	isort -rc $(PARDIR)

po:
	$(MAKE) po -C $(SRCDIR)/locale/

mo:
	$(MAKE) mo -C $(SRCDIR)/locale/

apidocs:
	sphinx-apidoc -f -o $(APIDOC_OUTPUT) -f $(APIDOC_SOURCES) $(APIDOC_EXCLUDE)
	$(MAKE) html -C $(SRCDIR)/docs/

nameit:
	rm $(SRCDIR)/README.md && touch README.md
	git ls-files -z | xargs -0 sed -i "" "s/$(DEFAULT_NAME)/$(NAME)/g";
	mv $(DEFAULT_NAME)/ $(NAME)/
