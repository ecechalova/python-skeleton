#!/bin/bash
set -ex

PROJECT_ROOT="$(dirname $(dirname $(realpath $0)))"

pylint --rcfile ${PROJECT_ROOT}/pyproject.toml \
       ${PROJECT_ROOT}/src/ \
       ${PROJECT_ROOT}/tests/

mypy --show-error-codes \
     --cache-dir=/dev/null \
     --config-file=${PROJECT_ROOT}/scripts/mypy.ini \
     "$@" ${PROJECT_ROOT}/src/

bandit --skip B101 --recursive ${PROJECT_ROOT}/src/

safety check \
       -r ${PROJECT_ROOT}/requirements.txt \
       -r ${PROJECT_ROOT}/requirements-dev.txt
