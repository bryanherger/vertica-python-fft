import vertica_sdk
import numpy as np

class pyFFT(vertica_sdk.TransformFunction):
    def processPartition(self, server_interface, input, output):
        rc = 0
        asig = []
        tsig = []
        while True:
            rc = rc + 1
            tsig.append(input.getFloat(0))
            asig.append(input.getFloat(1))
            if not input.next():
                break
        s = np.array(asig)
        server_interface.log("pyFFT Stats(1):"+str(rc)+","+str(s.size))
        fft = np.fft.fft(s)
        for i in range(N // 2):
            output.setFloat(0, f[i//2])
            output.setFloat(1, np.abs(fft)[i // 2])
            output.next()

class pyFFTFactory(vertica_sdk.TransformFunctionFactory):
    def getPrototype(self, server_interface, arg_types, return_type):
        arg_types.addFloat()
        arg_types.addFloat()
        return_type.addFloat()
        return_type.addFloat()
    def getReturnType(self, server_interface, arg_types, return_type):
        return_type.addColumn(arg_types.getColumnType(0), "frequency")
        return_type.addColumn(arg_types.getColumnType(1), "amplitude")
    def createTransformFunction(cls, server_interface):
        return pyFFT()
