
install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	pylint --disable=R,C nlib csvcli

test:
	@cd tests; pytest -vv --cov-report term-missing --cov=nlib test_*.py

format:
	black nlib/*.py csvcli.py tests/*.py