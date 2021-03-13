#!/bin/bash
set -ex

PROJECT_ROOT="$(dirname $(dirname $(realpath $0)))"

isort ${PROJECT_ROOT}/src/ ${PROJECT_ROOT}/tests/
black ${PROJECT_ROOT}/src/ ${PROJECT_ROOT}/tests/
