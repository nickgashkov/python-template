#!/usr/bin/env python3
#
# Copyright (c) 2017 Nick Gashkov
#
# Distributed under MIT License. See LICENSE file for details.

import logging
import os
import sys

log = logging.getLogger(__name__)

try:
    from src import settings
except ImportError as e:
    log.debug(e)

    current_path = os.path.dirname(__file__)
    root = os.path.abspath(os.path.join(current_path, '..', '..', '..'))
    sys.path.append(root)

    from src import settings


extensions = ['sphinx.ext.autodoc', 'sphinx.ext.viewcode']

templates_path = ['_templates']
exclude_patterns = []

master_doc = 'index'
source_suffix = '.rst'


project = settings.SPHINX_PROJECT
copyright = settings.SPHINX_COPYRIGHT
author = settings.SPHINX_AUTHOR
version = settings.SPHINX_VERSION
release = settings.SPHINX_RELEASE
language = settings.SPHINX_LANGUAGE


pygments_style = 'sphinx'
todo_include_todos = False


html_theme = 'sphinx_rtd_theme'
html_static_path = ['_static']
html_sidebars = {
    '**': [
        'relations.html',
        'searchbox.html',
    ]
}
htmlhelp_basename = 'helpdoc'

latex_elements = {}
latex_documents = [
    (
        master_doc,
        f'{project}.tex',
        f'{project} Documentation',
        f'{project}',
        'manual',
    ),
]

man_pages = [
    (
        master_doc,
        f'{project}',
        f'{project} Documentation',
        [author],
        1,
    ),
]

texinfo_documents = [
    (
        master_doc,
        f'{project}',
        f'{project} Documentation',
        author,
        f'{project}',
        '',
        'Miscellaneous'
    ),
]
