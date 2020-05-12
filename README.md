# vertica-python-fft
A Python UDTF for Vertica that implements Numpy Fast Fourier Transform (FFT)

What's included: the Python library and a sample SQL to load and test the library.

What's NOT included: Vertica only ships with a basic set of site packages, not including numpy.  You can install numpy into Vertica's Python environment by running the following command on all nodes:

sudo /opt/vertica/oss/python3/bin/python3 -m pip install numpy

For more info and an example usage, please see the blog post at https://www.vertica.com/blog/extending-vertica-with-python-functions-adding-numpy-fft-as-a-udx/
