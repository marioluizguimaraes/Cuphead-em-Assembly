.text

main: 	
	# Endereço inicial da memória de vídeo
	lui $8, 0x1001         # Primeiro endereço de memória para o display
	
	# Chamada para desenhar o céu
	jal desenha_ceu
		
	# Chamada para desenhar o mar 1
	jal desenha_mar1
	
	# Chamada para desenhar o mar 2
	jal desenha_mar2
	
	# Chamada para desenhar o mar 3
	jal desenha_mar3
	
	# Finalização do programa
	addi $2, $0, 10
	syscall

# Sub-rotina para desenhar o céu
desenha_ceu:
	ori $9, $0, 0xfff2cc   # Cor do céu
	li $10, 32768          # Número de unidade de pixels (512x64)
	li $11, 0              # Contador
	
forCeu: 
	beq $11, $10, retorna  # Verifica se todas as unidades de pixels foram desenhados
	sw $9, 0($8)           # Salva o código da cor no endereço atual
	addi $8, $8, 4         # Aponta para o próximo endereço
	addi $11, $11, 1       # Incrementa o contador
	j forCeu               


# Sub-rotina para desenhar o mar 1
desenha_mar1:
	lui $8, 0x1001          # Primeiro endereço de memória
	addi $8, $8, 25600      # Posição inicial do mar (linha 50)
	
	ori $9, $0, 0x6d9eeb    # Cor do mar
	li $10, 1792            # Número de unidades de pixels do mar (128*14)
	li $11, 0               # Contador
	
forMar1:
	beq $11, $10, retorna   # Verifica se todas as unidades de pixels foram desenhados
	sw $9, 0($8)            # Salva o código da cor no endereço atual
	addi $8, $8, 4          # Move para o próximo endereço
	addi $11, $11, 1        # Incrementa o contador
	j forMar1                

# Sub-rotina para desenhar o mar 2
desenha_mar2:
	lui $8, 0x1001          # Primeiro endereço de memória
	addi $8, $8, 27648      # Posição inicial do mar (linha 54)
	
	ori $9, $0, 0x3d85c6   # Cor do mar
	li $10, 1280	        # Número de unidades de pixels do mar (128*10)
	li $11, 0               # Contador
	
forMar2:
	beq $11, $10, retorna   # Verifica se todas as unidades de pixels foram desenhados
	sw $9, 0($8)            # Salva o código da cor no endereço atual
	addi $8, $8, 4          # Move para o próximo endereço
	addi $11, $11, 1        # Incrementa o contador
	j forMar2     

# Sub-rotina para desenhar o mar 3
desenha_mar3:
	lui $8, 0x1001          # Primeiro endereço de memória
	addi $8, $8, 29696      # Posição inicial do mar (linha 58)
	
	ori $9, $0, 0x0b5394   # Cor do mar
	li $10, 896	        # Número de unidades de pixels do mar (128*7)
	li $11, 0               # Contador
	
forMar3:
	beq $11, $10, retorna   # Verifica se todas as unidades de pixels foram desenhados
	sw $9, 0($8)            # Salva o código da cor no endereço atual
	addi $8, $8, 4          # Move para o próximo endereço
	addi $11, $11, 1        # Incrementa o contador
	j forMar3            	       	
# Sub-rotina para retornar para o ponto de chamada	
retorna:
	jr $31