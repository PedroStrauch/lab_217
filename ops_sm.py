import cocotb
from cocotb.types import LogicArray

def int_to_sm(num, w):
    if(num > 0):
        return LogicArray.from_unsigned(num, w)
    else:
        n = (-1)*num + 2**(w-1)
        return LogicArray.from_unsigned(n, w)

def sm_to_int(a: LogicArray):
    if (bool(a[(a.__len__()) -1])):
        return (-1)*LogicArray.to_unsigned(a[(a.__len__()) -2: 0])
    else:
        return LogicArray.to_unsigned(a)