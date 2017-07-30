Python Skeleton
===============

A sample Python module skeleton used to make TDD Python more easy.

Usage
-----

(Example usage requires virtuenvwrapper)

```
# Download the repo
git clone https://github.com/miketwo/python-skeleton.git
cd python-skeleton

# Create a virtual environment to work in
mkvirtualenv PROGRAMNAME
make init   # installs dependencies

# Start TDD -- this runs pytest-watch, which will continouosly rerun tests
# as you develop
make test
```

Now modify a test in `/tests` or the example code in `/skeleton/core.py` to see the unit tests rerunning. Tada! TDD.

License
-------

Uses the `MIT`_ license.


.. _MIT: http://opensource.org/licenses/MIT
