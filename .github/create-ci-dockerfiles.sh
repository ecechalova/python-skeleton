#!/bin/bash
set -ex

# It's not possible to target build stages in GitHub actions `docker` action
# so we have to template these instead to avoid code duplication. Also, the file
# must be named "Dockerfile" which conflicts with the existing Dockerfile

PROJECT_ROOT="$(dirname $(dirname $(realpath $0)))"

# Save the original dockerfile
mv "$PROJECT_ROOT/Dockerfile" "$PROJECT_ROOT/.dockerfile"

for SCRIPT in "tests" "lint"
do
    cat "$PROJECT_ROOT/.dockerfile" > "$PROJECT_ROOT/Dockerfile"
    printf "\nENTRYPOINT [\"/usr/src/app/scripts/$SCRIPT.sh\"]" >> "$PROJECT_ROOT/Dockerfile"
done
