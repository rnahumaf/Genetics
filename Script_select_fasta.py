# Definir diretorio
import os
import pandas
os.getcwd()

# Mudar diretório
os.chdir('\Py_WorkingDirectory')

# Open file
cabec = pandas.read_csv('cabec.txt', header = None)
fasta = pandas.read_csv('fasta.fa', header = None)

# Remover whitespaces
cabec.iloc[:,0] = cabec.iloc[:,0].str.replace(' ', '')

# Mudar para listas (processamento mais rápido)
cabec2 = cabec.values.tolist()
fasta2 = fasta.values.tolist()

# Usar cabecalho para selecionar linhas para uma nova lista
df = []
counts = 0
for i in range(len(fasta2)):
    if fasta2[i] in cabec2:
        counts = counts + 1
        print(counts)
        df.append(fasta2[i])
        activate = True
    else:
        if [">" in s for s in fasta2[i]]==[True]:
            activate = False
            continue
        else:
            if activate:
                df.append(fasta2[i])

# Salvar
with open("file.txt", "w") as output:
    for i in df:
        output.write(str(*i) + "\n")
