.text

# RG: $16, $20

moverEsquerdaFantasma:

	sw $31, 0($29)  # Salva o endereço de retorno na pilha
	addi $29, $29, -4  

	# Fazendo backup dos registradores na pilha
	sw $16, 0($29)
	addi $29, $29, -4
	sw $20, 0($29)
	addi $29, $29, -4
	
	li $4, 512 		# Define a posição inicial do baiacu
	jal desenharFantasma	# Chama a função para desenhar o baiacu verde
	add $20, $0, $4 	# posição inicial
	
	lui $16, 0x1001  	
	addi $16, $16, 65576 	# ponteiro na memoria
	sw $20, 0($16) 		# Armazena a posição atual do baiacu na memória
	
	jal timer  		# Chama a função de temporização
	
	# Obtém a posição atual do baiacu
	lw $4, 0($16)
	jal removerFantasma # Remove o baiacu da posição atual
	
	# Calcula a nova posição subindo 512 unidades
	lw $20, 0($16)
	addi $4, $20, -4 
	jal desenharFantasma # Desenha o baiacu na nova posição
	
	# Atualiza a posição do baiacu
	lw $20, 0($16)
	addi $20, $20, -4 
	sw $20, 0($16) # Armazena a nova posição
	
retorna_subir:

	addi $29, $29, 4
	lw $20, 0($29)
	addi $29, $29, 4
	lw $16, 0($29)
	addi $29, $29, 4
	lw $31, 0($29)

	jr $31	# Retorna para a função chamadora	 	

  	
#====================================================================================================

removerFantasma:	

# RG: $8, $10, $11, $12, $13, $14, $15, 17

	sw $31, 0($29)  # Salva o endereço de retorno na pilha
	addi $29, $29, -4  

	# Fazendo backup dos registradores na pilha
	sw $8, 0($29)
	addi $29, $29, -4
	sw $10, 0($29)
	addi $29, $29, -4
	sw $11, 0($29)
	addi $29, $29, -4
	sw $12, 0($29)
	addi $29, $29, -4
	sw $13, 0($29)
	addi $29, $29, -4
	sw $14, 0($29)
	addi $29, $29, -4	
	sw $15, 0($29)
	addi $29, $29, -4
	sw $17, 0($29)
	addi $29, $29, -4
	
	lui $8, 0x1001 # Carrega endereço base
	add $8, $8, $4 # Calcula endereço do baiacu
	addi $12, $8, 32768 # Ajusta um segundo endereço
	
	# Inicializa as variáveis para percorrer a matriz
	li $10, 25  # Número de colunas
	li $11, 0  # Contador de colunas
	
	li $13, 11  # Número de linhas
	li $14, 0  # Contador de linhas

#---------------------------------------------------------------------------------------------------
	
forLinha_removerFantasma: # Loop para percorrer linhas
	beq $13, $14 retorna_removerFantasma # Se atingiu o número de linhas, retorna
	
	add $15, $0, $8 # Salva o valor inicial da linha
	
forColuna_removerFantasma: # Loop para percorrer colunas
	beq $10, $11, proxima_linha_removerFantasma # Se atingiu o número de colunas, passa para a próxima linha
	
	lw $17, 0($12) # Carrega um valor
	sw $17, 0($8) # Substitui o valor na posição do baiacu
	
	addi $8, $8, 4 # Move para a próxima coluna
	addi $12, $12, 4 # Move para a próxima coluna na memória
	
	addi $11, $11, 1 # Incrementa a contagem de colunas
	
	j forColuna_removerFantasma # Continua percorrendo as colunas

proxima_linha_removerFantasma:
	li $11, 0 # Reseta o contador de colunas
	addi $14, $14, 1 # Incrementa a linha
	addi $8, $15, 512 # Move para a próxima linha
	addi $12, $8, 32768 # Ajusta o segundo endereço
	
	j forLinha_removerFantasma # Continua percorrendo as linhas

#---------------------------------------------------------------------------------------------------
			
retorna_removerFantasma:

	# Recuperando o backup dos registradores
	addi $29, $29, 4
	lw $17, 0($29)
	addi $29, $29, 4
	lw $15, 0($29)
	addi $29, $29, 4
	lw $14, 0($29)
	addi $29, $29, 4
	lw $13, 0($29)
	addi $29, $29, 4
	lw $12, 0($29)
	addi $29, $29, 4
	lw $11, 0($29)
	addi $29, $29, 4
	lw $10, 0($29)
	addi $29, $29, 4
	lw $8, 0($29)
	addi $29, $29, 4
	lw $31, 0($29) # Recupera o endereço de retorno
	
	jr $31	# Retorna para a função chamadora
	
#====================================================================================================

timer: 
  sw $31, 0($sp) # Salva o endereço de retorno
  addi $sp, $sp, -4
       
  sw $20, 0($sp) # Salva $20 na pilha
  addi $sp, $sp, -4
  
  # Define a quantidade de ciclos para a espera
  addi $20, $0, 100000
  
forT:  
  beq $20, $0, fimT # Se chegou a zero, finaliza o timer
  nop # No operation
  nop
  addi $20, $20, -1 # Decrementa o contador      
  j forT # Continua no loop    
                
fimT:  
  	addi $sp, $sp, 4                                                    
  	lw $20, 0($sp) # Restaura o valor de $20

  	addi $sp, $sp, 4                                                    
  	lw $31, 0($sp) # Restaura o endereço de retorno
  	jr $31 # Retorna para a função chamadora