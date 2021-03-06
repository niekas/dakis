all: bin/django

help:
	@echo 'make ubuntu     install the necessary system packages (requires sudo)'
	@echo 'make            set up the development environment'
	@echo 'make run        start the web server'
	@echo 'make test       run project test suite'
	@echo 'make testall    run all tests, pyflakes, pylint and coverage'
	@echo 'make tags       build ctags file'

ubuntu:
	sudo apt-get update
	sudo apt-get -y build-dep python-psycopg2
	sudo apt-get -y install build-essential python-dev exuberant-ctags

run: bin/django ; bin/django runserver

test: bin/django ; bin/django test --settings=dakis.settings.testing --nologcapture

testall: bin/django ; scripts/runtests.py dakis

tags: bin/django ; bin/ctags -v --tag-relative


buildout.cfg: ; ./scripts/genconfig.py config/env/development.cfg

bin/pip: ; virtualenv --no-site-packages --python=python3 .

bin/buildout: bin/pip ; $< install zc.buildout==2.3.1

mkdirs: var/www/static var/www/media

var/www/static var/www/media: ; mkdir -p $@

bin/django: bin/buildout buildout.cfg $(wildcard config/*.cfg) $(wildcard config/env/*.cfg) mkdirs ; $<
	bin/django compilemessages
	bin/django collectstatic --noinput

shell:
	bin/django shell_plus

.PHONY: all help run mkdirs test testall tags
