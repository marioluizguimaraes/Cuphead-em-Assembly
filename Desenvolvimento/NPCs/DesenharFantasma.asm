.text



# RG: $8, $9, $10, $11, $14


desenharfantasma:

	sw $31, 0($29)
 	add $29, $29, -4 	
	
	# Primeiro endereço de memória para o display
	lui $8, 0x1001
	add $8, $8, $4

	ori $9, $0, 0x8fc4cc   	# Cor do fantasmaaff   	# Cor do fantasma
	li $14, 4		# Controle de direcao (Horizontal)role de direcao (Horizontal)
	
	addi $8, $8, 40
	li $10, 5  		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 488	# 512 - (6*4)
	li $10, 9  		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 468	# 512 - (11*4)
	li $10, 13  		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador 
	jal desenha_traco
	
	addi $8, $8, 8		# 8
	li $10, 4  		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	
	addi $8, $8, 436	# 512 - (19*4)
	li $10, 18 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 444	# 512 - (17*4)
	li $10, 16  		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 448	# 512 - (16*4)
	li $10, 15  		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 456	# 512 - (16*4)
	li $10, 12 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	
	addi $8, $8, 468	# 512 - (11*4)
	li $10, 8 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 480	# 512 - (8*4)
	li $10, 2 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 4		# 4
	li $10, 3		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 484	# 512 - (8*4)
	sw $9, 0($8)            # Salva o código da cor no endereço atual
	sw $9, 8($8)            # Salva o código da cor no endereço atual
	sw $9, 516($8)          # Salva o código da cor no endereço atual
	
	
	addi $29, $29, 4
	lw $31, 0($29)
	add $4, $0, $0

#--------------------------------------------------------------------------	
	lui $8, 0x1001
	add $8, $8, $4
	
	ori $9, $0, 0xd4faff  	# Cor do fantasmaa
	
	addi $8, $8, 40		# 10*4
	li $10, 3 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	
	ori $9, $0, 0x000000  	# Cor do fantasmaaf
	sw $9, 0($8)
	
	ori $9, $0, 0xd4faff  	# Cor do fantasmaaf
	
	addi $8, $8, 4		
	li $10, 1 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 488	# 512 - (6*4)
	li $10, 3 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	ori $9, $0, 0x000000  	# Cor do fantasmaaf
	sw $9, 0($8)
	
	ori $9, $0, 0xd4faff  	# Cor do fantasmaaf
	
	addi $8, $8, 4		
	li $10, 3 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 476	# 512 - 9*4
	li $10, 2 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	ori $9, $0, 0x000000  	# Cor do fantasmaaf
		
	li $10, 3 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	ori $9, $0, 0xd4faff  	# Cor do fantasmaaf
			
	li $10, 6 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 16		# 4*4		
	li $10, 3 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	
	ori $9, $0, 0x000000  	# Cor do fantasmaa
	addi $8, $8, 448	# 512 - 16*4		
	li $10, 2 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	ori $9, $0, 0xd4faff  	# Cor do fantasmaaf
			
	li $10, 13 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	addi $8, $8, 16		# 4*4		
	li $10, 3 		# Número de unidade de pixelsmero de unidade de pixels
	li $11, 0              	# Contador
	jal desenha_traco
	
	
	
	
	
	
	
	

			
retorna:
	jr $31	
	
	
desenha_traco:
	beq $11, $10, retorna 	# Condição de parada (passar pelo numero de unida de pixeis)
	
	sw $9, 0($8)            # Salva o código da cor no endereço atual
	add $8, $8, $14        	# Move para o próximo endereço
	addi $11, $11, 1        # Incrementa o contador
	
	j desenha_traco  
