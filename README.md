# Python Skeleton

A sample Python module skeleton with a modern `src/` layout, `uv` for env/package management, `pytest` for tests, and `ruff` for linting/formatting.

![Hey there, Developer](https://cdn.pixabay.com/photo/2016/08/01/14/55/skeleton-1561177_640.png)

## Usage -- Docker

This sets up a dev environment inside of docker. Changes made on the host will be immediately reflected.

Pre-reqs: `docker`

```
# Download the repo
git clone https://github.com/miketwo/python-skeleton.git
cd python-skeleton

# Build and run the container
docker build -t my_container_name .
docker run -it -v $(pwd):/app my_container_name

# Run tests
./script/test

# Lint/format
./script/lint
./script/format

# Watch tests (rerun automatically on changes)
./script/test-watch

# Console
./script/console

# Now modify a test in `/tests` or the example code in `/src/skeleton/core.py`
# to see the unit tests rerunning. Tada! TDD.
```

#### Note about caches
Both python and pytest use caches to speed things up. If you are running the program or tests both inside and outside the container, these caches will conflict can each other. Whenever you switch environments, it's best to clear the cache by:
 - Running `find . -name \*.pyc -delete`
 - Using the `--cache-clear` option in pytest or manually deleting `__pycache__`


## Usage -- uv (recommended)

Pre-reqs: `uv`

```
# Download the repo
git clone https://github.com/miketwo/python-skeleton.git
cd python-skeleton

# Create a virtual environment and install dev deps
./script/setup

# Run tests
./script/test

# Lint/format
./script/lint
./script/format

# Watch tests (rerun automatically on changes)
./script/test-watch

# Now modify a test in `/tests` or the example code in `/src/skeleton/core.py`
# to see the unit tests rerunning. Tada! TDD.
```

## Contributing

Contributions are welcome! Just submit a PR.

## License

Uses the [MIT](http://opensource.org/licenses/MIT) license.
