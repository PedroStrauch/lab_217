from math import floor

def main():
    d = []
    d_prox = 2
    w = int(input())
    
    while(d_prox < w):
        d.append(d_prox)
        d_prox = floor(d_prox*1.5)
    
    arq = open(f"dadda_{w}bits.v", "w")
    
    arq.close()

main()