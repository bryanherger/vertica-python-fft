# vertica-python-fft
A Python UDTF for Vertica that implements Numpy Fast Fourier Transform (FFT)

What's included: the Python library and a sample SQL to load and test the library.

What's NOT included: you'll need to create a Python 3.5.x virtualenv since that is the version Vertica uses.  CentOS 7 defaults to Python 3.6.x, so you'll need to install a compatible 3.5.x release.  I followed the directions here to install on CentOS 7:

https://www.softwarecollections.org/en/scls/rhscl/rh-python35/

Activate the virtual environment, then run pip to install and/or update pip, setuptools, wheel, numpy.  Edit the SQL to point to the site-packages of this virtualenv, and you should be able to run the SQL with vsql.

