#!/bin/bash
set -ex

PROJECT_ROOT="$(dirname $(realpath $0))"

pip install --editable ${PROJECT_ROOT}
pytest --capture=sys --import-mode=importlib "$@" ${PROJECT_ROOT}/tests/
