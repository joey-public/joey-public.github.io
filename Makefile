PYTHON = ~/PythonEnvs/myenv/bin/python
GEN_SITE = ~/MyScripts/python/genSite.py
build:
	$(PYTHON) $(GEN_SITE) ./markdown/ ./html/ 

publish:
	git add -A
	git commit -m "$msg"
	git push -u origin master 

