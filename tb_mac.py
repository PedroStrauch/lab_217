import cocotb
from cocotb.triggers import Timer, RisingEdge
from cocotb.clock import Clock
from ops_sm import int_to_sm, sm_to_int

#def contante
W = 4

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

    for caso in dados:
        dut.num1.value = int_to_sm(int(caso[0]), W)
        dut.num2.value = int_to_sm(int(caso[1]), W)
        mac += int(caso[0])*int(caso[1])
        await Timer(10, unit="ns")
        await RisingEdge(dut.clk)
        await Timer(10, unit="ns")
        cocotb.log.info("%d : %d", mac, sm_to_int(dut.s.value))
        assert dut.s.value == int_to_sm(mac, 2*W)

