# Skeleton
Project "skeleton" provides a simple template for python based projects. It's based on the following technologies:

* `docker` to provide an isolated python runtime
    - `./Dockerfile`
    - requires `docker` and its dependencies to be installed on the developer's machine
* `docker-compose` to define the full development environment together with service containers, networking, etc.
    - `./docker-compose.yaml`
    - requires `docker-compose` to be installed on the developer's machine
    - use `LD_LIBRARY_PATH=/usr/local/lib docker-compose up -d --build` to build the app image
    - use `docker-compose run --rm app` to exec into a dev container
* `setuptools` to define the application package
    - `./setup.py` holds the project metadata
* `pip` to install the application dependencies
    - run `pip install --editable .` to install the application package into the dev environment
* `pip-tools` for dependency resolution and pinning
    - `./setup.py` specifies the app's dependencies
    - `./requirements-dev.in` specifies dev dependencies
    - `./scripts/dep_lock.sh` resolves the dependencies and creates a lock file
    - `./scripts/dep_sync.sh` install the resolved dependencies into the dev environment
* `pipx` to install python-based development tools isolated
    - `./Dockerfile` lists the tools to be installed when the app image is built
* `isort` and `black` (both installed via `pipx`) to format the code
    - `./pyproject.toml` contains the configuration
    - `./scripts/format.sh` runs both `isort` and `black`
* `bandit` (installed via `pipx`) to check for unsafe code
    - use `./scripts/lint.sh` to run the checks
* `safety` (installed via `pipx`) to check the dependencies for known vulnerabilities
    - use `./scripts/lint.sh` to run the checks
* `pylint` to check code conventions
    - `./scripts/pylint.ini` contains the configuration
    - use `./scripts/lint.sh` to run the checks
* `mypy` to perform static type checking
    - `./scripts/mypy.ini` contains the configuration
    - use `./scripts/lint.sh` to run the checks
* `pytest` as the unit testing framework (installed with `pytest-cov` and `pytest-mock` plugins)
    - `./pyproject.toml` contains the configuration
    - `./scripts/tests.sh` runs the tests
* `coverate` to gather branch coverage statistics
    - `./pyproject.toml` contains the configuration
    - `./scripts/tests.sh` runs `coverage` via `pytest`


## TODO:
* setup github actions
* update source files in place when running `isort` (to avoid permission changes)
* run editable install automatically on container start
