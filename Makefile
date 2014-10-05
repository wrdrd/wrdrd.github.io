


default: build


all:
	$(MAKE) build
	$(MAKE) push

all-serve-open: all view

build:
	@echo 'Building...'

serve:
	python -m SimpleHTTPServer 18283

open:
	open http://localhost:18283/

view:
	$(MAKE) serve & $(MAKE) open

setup:
	$(MAKE) setup_remotes
	$(MAKE) pull

setup_remotes:
	# git clone ssh://git@github.com/wrdrd/wrdrd.github.io .
	git remote remove origin || true
	git remote add origin ssh://git@github.com/wrdrd/wrdrd.github.io
	git remote remove wrd || true
	git remote add wrd ssh://git@github.com/wrd/wrd.github.io
	git remote -v
	#
	# See also: $ make pull
	# 

pull:
	git pull origin master
	git pull wrd master

push:
	git push origin master
	git push -f wrd master

