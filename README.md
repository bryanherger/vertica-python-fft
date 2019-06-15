# vertica-python-fft
A Python UDTF for Vertica that implements Numpy Fast Fourier Transform (FFT)

What's included: the Python library and a sample SQL to load and test the library.

What's NOT included: you'll need to create a Python 3.5.x virtualenv since that is the version Vertica uses.  Then run pip to install and/or update pip, setuptools, wheel, numpy.  Edit the SQL to point to the site-packages of this virtualenv and it should work.

