# Definir diretorio
setwd("\R_WorkingDirectory")

# Abrir arquivos e salvar em dataframe
cabec <- read.delim('cabec.txt'), header = FALSE) 
cabec <- data.frame(cabec)
fasta <- read.delim('fasta.fa', header = FALSE) 
fasta <- data.frame(fasta)

# Cortar os espacos vazios que podem atrapalhar
fasta2 <- trimws(fasta[,1])
cabec2 <- trimws(cabec[,1])

# Encontrar cabecalhos em dataframe
df <- data.frame()
for(i in 1:length(fasta2)){
  if(fasta2[i] %in% cabec2){
    active <- TRUE
    df[nrow(df)+1,1] <- fasta2[i]
    print(sum(grepl('>', df[,1])))
  } else {
    if(grepl(">", fasta2[i])){
      active <- FALSE
      next
    } else {
      if(active){
        df[nrow(df)+1,1] <- fasta2[i]
      }
    }
  }
}

#salvar
write.table(df, file = 'file.fasta', sep = '', col.names = F, row.names = F, quote = F)
