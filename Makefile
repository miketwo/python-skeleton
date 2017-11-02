.PHONY: init
init:
	pip install -r requirements.txt

.PHONY: test
test:
	find . -name \*.pyc -delete
	ptw -- -v -s --cache-clear
