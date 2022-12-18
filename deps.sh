#!/usr/bin/env bash
# Script deps.sh installs dependencies with Homebrew and pyenv.

set -e # exit if any command fails—see https://gist.github.com/mohanpedala/1e2ff5661761d3abd0385e8223e16425#set--e.

if ! command -v pyenv >/dev/null
then
	brew install pyenv
fi

python_version=$(cat .python-version)

if [[ ! -d ~/.pyenv/versions/$python_version ]]
then
	pyenv install $python_version
fi

if [[ $(awk '/^version/ { print $3 }' venv/pyvenv.cfg) != $python_version ]]
then
	rm -rf venv
	python -m venv venv
fi

source venv/bin/activate

pip install -r requirements-to-freeze.txt
