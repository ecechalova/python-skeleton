#!/bin/bash
set -ex

PROJECT_ROOT="$(dirname $(realpath $0))"

pytest --capture=sys --import-mode=importlib "$@" ${PROJECT_ROOT}/tests/
