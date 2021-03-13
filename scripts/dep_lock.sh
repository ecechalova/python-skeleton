#!/bin/bash
set -ex

PROJECT_ROOT="$(dirname $(dirname $(realpath $0)))"

pip-compile --generate-hashes --output-file=requirements.txt
pip-compile --generate-hashes --output-file=requirements-dev.txt requirements-dev.in
