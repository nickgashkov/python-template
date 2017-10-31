.PHONY: help Makefile

SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
SPHINXPROJ    =
SOURCEDIR     = source
BUILDDIR      = build


help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
