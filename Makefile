PYTHON = ~/PythonEnvs/myenv/bin/python
GEN_SITE = ~/MyScripts/python/genSite.py
REFRESH_FFOX = ./ffox_update.sh

SHELL := /bin/bash

build:
	$(PYTHON) $(GEN_SITE) ./markdown/ ./html/ 

vim:
	$(PYTHON) $(GEN_SITE) ./markdown/ ./html/ 
	source $(REFRESH_FFOX)


publish:
	git add -A
	git commit -m "$msg"
	git push -u origin master 

