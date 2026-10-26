"""Las L de src/pNN.notes con el nombre y la descripcion de src/rutinas.txt (la fuente): una L vieja en las notas tapaba la descripcion nueva. Lo llama tools/mete_lote.py."""
import glob,re,os
rut={}
RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(RAIZ)
for ln in open('src/rutinas.txt',encoding='utf-8'):
    if not ln.strip() or ln.startswith('#'): continue
    cab,_,que=ln.rstrip('\n').partition('  ')
    p,a,nom=cab.split()
    rut[(int(p[1:]),int(a,0))]=(nom,que.strip())
n=0
for ruta in glob.glob('src/p[0-9][0-9].notes'):
    b=int(os.path.basename(ruta)[1:3])
    L=open(ruta,encoding='utf-8').read().split('\n'); out=[]
    for l in L:
        m=re.match(r'^L (0x[0-9A-Fa-f]{4}) (\S+)(?: (.*))?$',l)
        if m and (b,int(m.group(1),16)) in rut:
            nom,que=rut[(b,int(m.group(1),16))]
            nl='L %s %s %s'%(m.group(1),nom,que) if que else 'L %s %s'%(m.group(1),nom)
            if nl!=l: n+=1; l=nl
        out.append(l)
    open(ruta,'w',encoding='utf-8',newline='\n').write('\n'.join(out))
print('cambiadas',n)
