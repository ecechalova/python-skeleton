#!/bin/bash
set -ex

# It's not possible to target build stages in GitHub actions `docker` action
# so we have to template these instead to avoid code duplication.

PROJECT_ROOT="$(dirname $(dirname $(realpath $0)))"

for SCRIPT in "tests" "lint"
do
    DOCKERFILE="$PROJECT_ROOT/github-dockerfile-$SCRIPT"
    cat $PROJECT_ROOT/Dockerfile > "$DOCKERFILE"
    printf "\nENTRYPOINT [\"/usr/src/app/scripts/$SCRIPT.sh\"]" >> "$DOCKERFILE"
done
