import cocotb
from cocotb.triggers import Timer
from ops_sm import int_to_bin, bin_to_int

#def contante
w1 = 8
w2 = 3

@cocotb.test()
async def teste1(dut):
    c2 = 0
    arq = open('db_mult.txt')
    txt = arq.read()
    arq.close()
    txt = txt.split('\n')
    dados = []
    i = 0
    while(txt[i] != "//" and i < len(txt)):
        #print(txt[i])
        dados.append(txt[i].split(' '))
        i+=1

    for x in dados:
        dut.n1.value = int_to_bin(int(x[0]), w1, c2)
        dut.n2.value = int_to_bin(int(x[1]), w2, c2)
        await Timer(10, unit="ns")
        cocotb.log.info("%d * %d = %d", int(x[0]), int(x[1]), bin_to_int(dut.out.value, c2))
        cocotb.log.info("%s * %s = %s", int_to_bin(int(x[0]), w1, c2), int_to_bin(int(x[1]), w2, c2), dut.out.value)
        r = int(x[0])*int(x[1])
        cocotb.log.info("%s", int_to_bin(r, w1+w2, c2))
        assert dut.out.value == int_to_bin(r, w1+w2, c2)
