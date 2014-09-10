


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

push:
	git push origin master

