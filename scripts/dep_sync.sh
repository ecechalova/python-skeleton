#!/bin/bash
set -ex

PROJECT_ROOT="$(dirname $(dirname $(realpath $0)))"

pip-sync requirements.txt requirements-dev.txt
