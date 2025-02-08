.text

# RG: $8, $9, $10, $11, $14

desenharBaiacuVerde:

	sw $31, 0($29)  # Salva o endereço de retorno
	addi $29, $29, -4  

	# Fazendo o Backup na pilha
	sw $8, 0($29)    # Salva $8 na pilha
	addi $29, $29, -4
	sw $9, 0($29)    # Salva $9 na pilha
	addi $29, $29, -4
	sw $10, 0($29)   # Salva $10 na pilha
	addi $29, $29, -4
	sw $11, 0($29)   # Salva $11 na pilha
	addi $29, $29, -4
	sw $14, 0($29)   # Salva $14 na pilha
	addi $29, $29, -4	
 	
 	# Primeiro endereço de memória para o display
	lui $8, 0x1001
	add $8, $8, $4
	
	ori $9, $0, 0x38761d   	# Cor do fantasmaaff   	# Cor do fantasma
	li $14, 4		# Controle de direcao (Horizontal)role de direcao (Horizontal)
	
	sw $9, 4($8)
	
	addi $8, $8, 12		
	li $10, 3  		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	sw $9, 4($8)
	
	addi $8, $8, 496		
	li $10, 5  		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 488		
	li $10, 7  		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 480		
	li $10, 9  		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 476		
	li $10, 9  		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco

	addi $8, $8, 480		
	li $10, 7  		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	sw $9,480($8)
	sw $9,512($8)
	
	addi $8, $8, 488		
	li $10, 5  		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	sw $9,496($8)
	sw $9,504($8)

#=========================================================================================

	lui $8, 0x1001
	add $8, $8, $4
	
	ori $9, $0, 0x000000   	# Cor do fantasmaaff   	# Cor do fantasma
	sw $9,1032($8)
	sw $9,1044($8)
	
	ori $9, $0, 0xe5c34e   	# Cor do fantasmaaff   	# Cor do fantasma
	sw $9,1036($8)
	sw $9,1048($8)
	
	sw $9,1548($8)
	sw $9,1560($8)
	
	sw $9,1544($8)
	sw $9,1556($8)
	
	ori $9, $0, 0xffffff   	# Cor do fantasmaaff   	# Cor do fantasma
	sw $9,2572($8)
	sw $9,2580($8)
	
	ori $9, $0, 0x000000   	# Cor do fantasmaaff   	# Cor do fantasma
	sw $9,2576($8)
	
	# Recuperando o Backup na pilha
	addi $29, $29, 4
	lw $14, 0($29)
	addi $29, $29, 4
	lw $11, 0($29)
	addi $29, $29, 4
	lw $10, 0($29)
	addi $29, $29, 4
	lw $9, 0($29)
	addi $29, $29, 4
	lw $8, 0($29)
	addi $29, $29, 4
	lw $31, 0($29)
	
retorna:
	jr $31	
	
	
desenha_traco:
	beq $11, $10, retorna 	# Condição de parada (passar pelo numero de unida de pixeis)
	
	sw $9, 0($8)            # Salva o código da cor no endereço atual
	add $8, $8, $14        	# Move para o próximo endereço
	addi $11, $11, 1        # Incrementa o contador
	
	j desenha_traco  
