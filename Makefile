PTHON = ~/PythonEnvs/myenv/bin/python
GEN_SITE = ~/MyScripts/python/genSite.py
REFRESH_FFOX = ./ffox_update.sh

MD_DIR = ./markdown
HTML_DIR = ./html
EPUB_DIR = ./epub

SHELL := /bin/bash

build:
	$(PYTHON) $(GEN_SITE) ./markdown/ ./html/ 

vim:
	$(PYTHON) $(GEN_SITE) ./markdown/ ./html/ 
	source $(REFRESH_FFOX)

ebook:
	pandoc -o $(EPUB_DIR)/test.epub $(EPUB_DIR)/title.txt ./markdown/b_md2html_post0_intro.md ./markdown/b_md2html_post1_pythonsetup.md ./markdown/b_md2html_post2_wrtitingthecode.md

publish:
	git add -A
	git commit -m "$msg"
	git push -u origin master 

