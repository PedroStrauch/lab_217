import cocotb
from cocotb.types import LogicArray

def int_to_bin(num, w, c2):
    if(c2):
        return LogicArray.from_signed(num, w)
    elif(num >= 0):
        return LogicArray.from_unsigned(num, w)
    else:
        n = (-1)*num + 2**(w-1)
        return LogicArray.from_unsigned(n, w)

def bin_to_int(a: LogicArray, c2):
    if (c2):
        return LogicArray.to_signed(a)
    elif (bool(a[(a.__len__()) -1])):
        return (-1)*LogicArray.to_unsigned(a[(a.__len__()) -2: 0])
    else:
        return LogicArray.to_unsigned(a)
