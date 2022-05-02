# vertica-python-fft
A Python UDTF for Vertica that implements Numpy Fast Fourier Transform (FFT)

What's included: the Python library and a sample SQL to load and test the library.

What's NOT included: Vertica only ships with a basic set of site packages, not including numpy.  You can install numpy into Vertica's Python environment by installing to a virtualenv and uploading that using the DEPENDS clause:

```
/opt/vertica/oss/python3/bin/python3 -m venv ${VENV_PATH}
source ${VENV_PATH}/bin/activate
pip3 install numpy
python3 -c "import sys;print(sys.path);"
# The sys.path you want is likely last as ${VENV_PATH}/lib/python3.9/site-packages. Put this in DEPENDS in the sql.
```

For more info and an example usage, please see the blog post at https://www.vertica.com/blog/extending-vertica-with-python-functions-adding-numpy-fft-as-a-udx/
