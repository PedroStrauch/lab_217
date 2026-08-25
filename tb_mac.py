import cocotb
from cocotb.triggers import Timer, RisingEdge
from cocotb.clock import Clock
from ops_sm import int_to_bin, bin_to_int

#def contante
W = 8

@cocotb.test()
async def teste1(dut):
    mac = 0
    arq = open("db_mac")
    txt = arq.read()
    arq.close()
    txt = txt.split('\n')
    dados = []
    for x in txt:
        dados.append(x.split(' '))
    
    clk = Clock(dut.clk, 1, unit="us")  # create a 1us period clock on port clk
    cocotb.start_soon(clk.start())  # start the clock

    dut.rst.value = 1
    await Timer(2, unit='ns')
    dut.rst.value = 0
    dut.en.value = 1

    for caso in dados:
        dut.n1.value = int_to_bin(int(caso[0]), W, 0)
        dut.n2.value = int_to_bin(int(caso[1]), W, 0)
        mac += int(caso[0])*int(caso[1])
        await Timer(10, unit="ns")
        await RisingEdge(dut.clk)
        await Timer(10, unit="ns")
        cocotb.log.info("%d : %d", mac, bin_to_int(dut.s.value, 1))
        assert dut.s.value == int_to_bin(mac, 2*W, 1)

