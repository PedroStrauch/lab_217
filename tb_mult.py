import cocotb
from cocotb.triggers import Timer
from ops_sm import int_to_sm, sm_to_int

#def contante
W = 4

@cocotb.test()
async def teste1(dut):
    arq = open('db_mult.txt')
    txt = arq.read()
    arq.close()
    txt = txt.split('\n')
    dados = []
    for x in txt:
        dados.append(x.split(' '))

    for x in dados:
        dut.num1.value = int_to_sm(int(x[0]), W)
        dut.num2.value = int_to_sm(int(x[1]), W)
        await Timer(10, unit="ns")
        cocotb.log.info("%d * %d = %d", int(x[0]), int(x[1]), sm_to_int(dut.s.value))
        cocotb.log.info("%s * %s = %s", int_to_sm(int(x[0]), W), int_to_sm(int(x[1]), W), dut.s.value)
        
        cocotb.log.info("%s", int_to_sm(int(x[2]), 2*W))
        assert dut.s.value == int_to_sm(int(x[2]), 2*W)
