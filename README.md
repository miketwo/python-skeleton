# Python Skeleton

A sample Python module skeleton used to make TDD Python more easy. Works in both Docker and Virtualenv.

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

# Start TDD -- this continouosly reruns tests as you develop
make test

# Now modify a test in `/tests` or the example code in `/skeleton/core.py`
# to see the unit tests rerunning. Tada! TDD.
```

#### Note about caches
Both python and pytest use caches to speed things up. If you are running the program or tests both inside and outside the container, these caches will conflict can each other. Whenever you switch environments, it's best to clear the cache by:
 - Running `find . -name \*.pyc -delete`
 - Using the `--cache-clear` option in pytest or manually deleting `__pycache__`


## Usage -- Virtualenv

This is a more traditional virtual environment setup.

Pre-reqs: `virtualenvwrapper`. (Try `sudo pip install virtualenvwrapper` -- it might work.)


```
# Download the repo
git clone https://github.com/miketwo/python-skeleton.git
cd python-skeleton

# Create a virtual environment to work in
mkvirtualenv PROGRAMNAME
make init   # installs dependencies

# Start TDD -- this continouosly reruns tests as you develop
make test

# Now modify a test in `/tests` or the example code in `/skeleton/core.py`
# to see the unit tests rerunning. Tada! TDD.
```

## Contributing

Contributions are welcome! Just submit a PR.

## License

Uses the [MIT](http://opensource.org/licenses/MIT) license.
