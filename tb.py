import cocotb
from cocotb.triggers import Time

@cocotb.tst(dut)
async def t1(dut):
    print()