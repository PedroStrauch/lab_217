from math import floor
from collections import deque

class Adder:
    def __init__(self, type, inputs, outputs):
        self.type = type
        self.inputs = inputs
        self.outputs = outputs

    def txt(self, c, n):
        inout = "("
        for i in self.inputs:
            inout += f"{i[0]}[{i[1]}], "
        o = self.outputs
        inout += f"c{o[0][0]}[{o[0][1]}], "
        inout += f"c{o[1][0]}[{o[1][1]}]"
        inout += ");\n"
        return "\t" + self.type + f" p{c+1}_{n+1}" + inout


def txt_out(n, a, c, w):
    if(n == 0):
        return f"\tha p{c+1}_1({a[0][0]}[{a[0][1]}], {a[1][0]}[{a[1][1]}], out[1], c{c+1}[0]);\n"
    elif(n != w-2):
        return f"\tfa p{c+1}_{n+1}({a[0][0]}[{a[0][1]}], {a[1][0]}[{a[1][1]}], c{c+1}[{n-1}], out[{n+1}], c{c+1}[{n}]);\n"
    else:
        return f"\tfa p{c+1}_{n+1}({a[0][0]}[{a[0][1]}], {a[1][0]}[{a[1][1]}], c{c+1}[{n-1}], out[{n+1}], out[{n+2}]);\n"
        
    

        
# Essa implementação recebe 2 parametros para a largura dos dois numeros sendo multiplicados
def main():

    #Independente da ordem em que os parametros sejam inseridos a maior largura sempre sera w1 e a menor w2
    a = int(input("w1: "))
    b = int(input("w2: "))
    if (a > b):
        w1 = a
        w2 = b
    else:
        w1 = b
        w2 = a
    
    #Descobre o di inicial do algorítmo
    d = []
    d_prox = 2
    while(d_prox < w2+1):
        d.append(d_prox)
        d_prox = floor(d_prox*1.5)
    d.reverse()
    #print(d)

    #cria a "piramide" de soma
    soma = []
    for k in range(w1+w2):
        soma.append(deque([]))
        soma[k].append((f"ns", k))

    for i in range(w2):
        for j in range(w1):
            soma[i+j].append(("c0", i*w1+j))
            #print(i*w2+j)
    #print(soma)
    
    #determina quantos adders vão ter em cada camada e suas caraceristicas
    adder_list = []
    for i, di in enumerate(d):
        #print(soma, "\n")
        a = []
        c = 0
        for j, col in enumerate(soma):
            while(len(col) > di):
                if (len(col)-1 == di):
                    inp = []
                    inp.append(col.popleft())
                    inp.append(col.popleft())
                    a.append(Adder("ha", inp, [(i+1, c), (i+1, c+1)]))
                    col.append((i+1, c))
                    soma[j+1].append((f"c{i+1}", c+1))
                    c+=2
                else:
                    inp = []
                    inp.append(col.popleft())
                    inp.append(col.popleft())
                    inp.append(col.popleft())
                    a.append(Adder("fa", inp, [(i+1, c), (i+1, c+1)]))
                    col.append((i+1, c))
                    soma[j+1].append((f"c{i+1}", c+1))
                    c+=2
        adder_list.append(a)
    #print(soma)

    #creates the file and writes the verilog code  
    arq = open(f"verilog_code/dadda_s_{w1}x{w2}bits.v", "w")
    arq.write(f"module dadda_{w1}x{w2}bits(n1, n2, ns, out);\n\n\tinput [{w1-1}:0] n1;\n\tinput [{w2-1}:0] n2;\n\tinput [{w1+w2-1}:0] ns;\n\toutput [{w1+w2}:0] out;\n")

    arq.write(f"\n\twire [{w1*w2-1}:0] c0;\n")
    for c in range(len(d)):
        arq.write(f"\twire [{2*len(adder_list[c])-1}:0] c{c+1};\n")
    arq.write(f"\twire [{w1+w2-4}:0] c{len(d)+1};\n\n")

    arq.write(f"\tgenvar i, j;\n\n\tgenerate\n\t\tfor(i = 0; i < {w1}; i = i + 1)\n\t\tbegin: ands_n1\n\t\t\tfor(j = 0; j < {w2}; j = j + 1)\n\t\t\tbegin: ands_n2\n\t\t\t\tassign c0[(j*{w1})+i] = n1[i] & n2[j];\n\t\t\tend\n\t\tend\n\tendgenerate\n\n")

    for c in range(len(d)):
        arq.write(f"\t//camada {c+1} de somadores\n")
        for i, s in enumerate(adder_list[c]):
            arq.write(s.txt(c, i))
        arq.write("\n")

    arq.write("\t//camada final de somadores\n")
    arq.write("\tassign out[0] = c0[0];\n")
    soma.pop(0)
    for i, a in enumerate(soma):
        arq.write(f"{txt_out(i, a, len(d), w1+w2)}")
    arq.write("\nendmodule")
    arq.close()

main()