# This file is public domain, it can be freely copied without restrictions.
# SPDX-License-Identifier: CC0-1.0

# test_my_design.py (simple)

import cocotb
from cocotb.triggers import Timer
from cocotb.types import LogicArray

#def contante
W = 4

@cocotb.test()
async def my_first_test(dut):
    """Try accessing the design."""
    arq = open('test_soma_db.txt')
    txt = arq.read()
    arq.close()
    txt = txt.split('\n')
    dados = []
    for x in txt:
        dados.append(x.split(' '))

    for x in dados:
        dut.num1.value = int_to_sm(int(x[0]), 4)
        dut.num2.value = int_to_sm(int(x[1]), 4)
        await Timer(10, unit="ns")
        cocotb.log.info("%d + %d = %d", int(x[0]), int(x[1]), sm_to_int(dut.s.value))
        cocotb.log.info("%s + %s = %s", int_to_sm(int(x[0]), 4), int_to_sm(int(x[1]), 4), dut.s.value)
        
        cocotb.log.info("%s", int_to_sm(int(x[2]), 5))
        assert dut.s.value == int_to_sm(int(x[2]), 5)

def int_to_sm(num, w):
    if(num > 0):
        return LogicArray.from_unsigned(num, w)
    else:
        n = (-1)*num + 2**(w-1)
        return LogicArray.from_unsigned(n, w)

def sm_to_int(a: LogicArray):
    cocotb.log.info("%d", int(a[(a.__len__()) -1]))
    if (bool(a[(a.__len__()) -1])):
        cocotb.log.info("a<0")
        return (-1)*LogicArray.to_unsigned(a[0:])
    else:
        cocotb.log.info("a>0")
        return LogicArray.to_unsigned(a)