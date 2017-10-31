.PHONY: po mo

LANG = ru

POT_PATH = $(PARDIR)/src/locale/messages.pot

MO_PATH = $(PARDIR)/src/locale/$(LANG)/LC_MESSAGES/messages.mo
PO_PATH = $(PARDIR)/src/locale/$(LANG)/LC_MESSAGES/messages.po

SOURCES = -iname $(PARDIR)/*.py

po:
	touch $(POT_PATH) && touch $(PO_PATH)
	find . -type f $(SOURCES) | xargs xgettext -L python --output=$(POT_PATH)
	msgmerge --update --no-fuzzy-matching --backup=off $(PO_PATH) $(POT_PATH)

mo:
	touch $(MO_PATH)
	msgfmt -c -o $(MO_PATH) $(PO_PATH)
