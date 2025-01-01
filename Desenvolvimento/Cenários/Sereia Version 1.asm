.text

main: 	
	# Endereço inicial da memória de vídeo
	lui $8, 0x1001         	# Primeiro endereço de memória para o display
	
	# Chamada para desenhar o céu
	jal desenha_ceu
		
	# Chamada para desenhar o mar 1
	jal desenha_mar1

	# Finalização do programa
	addi $2, $0, 10
	syscall

# Sub-rotina para desenhar o céu
desenha_ceu:
	ori $9, $0, 0xfff2cc   	# Cor do céu
	li $10, 6400       	# Número de unidade de pixels (128x50)
	li $11, 0              	# Contador
	
forCeu: 
	beq $11, $10, retorna  	# Verifica se todas as unidades de pixels foram desenhados
	
	sw $9, 0($8)           	# Salva o código da cor no endereço atual
	addi $8, $8, 4         	# Aponta para o próximo endereço
	addi $11, $11, 1       	# Incrementa o contador
	
	j forCeu               

# Sub-rotina para desenhar o mar 1
desenha_mar1:

	lui $8, 0x1001          # Primeiro endereço de memória
	addi $8, $8, 25600      # Posição inicial do mar (linha 50)
	
	ori $9, $0, 0x6d9eeb    # Cor do mar
	li $10, 1792            # Número de unidades de pixels do mar (128*14)
	li $11, 0               # Contador
	
forMar1:
	beq $11, $10, ondas_mar1 # Verifica se todas as unidades de pixels foram desenhados
	
	sw $9, 0($8)            # Salva o código da cor no endereço atual
	addi $8, $8, 4          # Move para o próximo endereço
	addi $11, $11, 1        # Incrementa o contador
	
	j forMar1                


ondas_mar1:
    	add $25, $0, $31        # Salva o valor do registrador de retorno

    	lui $8, 0x1001          # Primeiro endereço de memória
    	addi $8, $8, 25092      # Posição inicial do mar (linha 48)
    	ori $9, $0, 0x6d9eeb    # Define a cor dos pixels (azul)

    	li $12, 10              # Número de traços para a primeira linha
    	jal forOndas1Tracos1    # Chamada para desenhar a primeira linha

    	lui $8, 0x1001          # Primeiro endereço de memória
    	addi $8, $8, 24588      # Posição inicial da segunda linha do mar (linha 47)
    	jal forOndas1Tracos2    # Chamada para desenhar a segunda linha

	lui $8, 0x1001          # Primeiro endereço de memória
    	addi $8, $8, 24084      # Posição inicial da terceira linha do mar (linha 46)
	jal forOndas1Tracos3
    
   	add $31, $0, $25        # Restaura o valor do registrador de retorno
    	jr $31                  # Retorna para o chamador

#-------------------------------------Primeira linha da onda 1----------------------------------------------#
forOndas1Tracos1:
    	li $13, 0               # Inicializa o contador de traços

loopLinha1:
    	beq $13, $12, retorna  # Se todos os traços foram desenhados, retorna

    	# Desenha 12 pixels para o traço atual
    	li $10, 12              # Número de pixels no traço
    	li $11, 0               # Contador de pixels no traço

loopTraco1:
    	beq $11, $10, onda1intervalo1 # Se todos os pixels do traço foram desenhados, vai para o intervalo
    	sw $9, 0($8)            # Salva o código da cor no endereço atual
    	addi $8, $8, 4          # Move para o próximo endereço
    	addi $11, $11, 1        # Incrementa o contador de pixels
    	j loopTraco1          # Repetição do loop para desenhar o traço

onda1intervalo1:
    	addi $8, $8, 4          # Adiciona 1 pixel de intervalo
    	addi $13, $13, 1        # Incrementa o contador de traços
    	j loopLinha1          # Repetição do loop de traços


#-------------------------------------Segunda linha da onda 1----------------------------------------------#
forOndas1Tracos2:
    	li $13, 0               # Inicializa o contador de traços

loopLinha2:
    	beq $13, $12, retorna  # Se todos os traços foram desenhados, retorna

    	# Desenha 8 pixels para o traço atual
    	li $10, 8               # Número de pixels no traço
    	li $11, 0               # Contador de pixels no traço

loopTraco2:
    	beq $11, $10, onda1intervalo2 # Se todos os pixels do traço foram desenhados, vai para o intervalo
    	sw $9, 0($8)            # Salva o código da cor no endereço atual
    	addi $8, $8, 4          # Move para o próximo endereço
    	addi $11, $11, 1        # Incrementa o contador de pixels
    	j loopTraco2          # Repetição do loop para desenhar o traço

onda1intervalo2:
    	addi $8, $8, 20         # Adiciona 1 pixel de intervalo
   	addi $13, $13, 1        # Incrementa o contador de traços
    	j loopLinha2          # Repetição do loop de traços		
    
               	       	           	       	
#-------------------------------------Terceira linha da onda 1---------------------------------------------#
forOndas1Tracos3:
    	li $13, 0               # Inicializa o contador de traços

loopTraco3:
    	beq $13, $12, retorna  # Se todos os traços foram desenhados, retorna

    	# Desenha 4 pixels para o traço atual
    	li $10, 4               # Número de pixels no traço
    	li $11, 0               # Contador de pixels no traço

loopLinha3:
    	beq $11, $10, onda1intervalo3 # Se todos os pixels do traço foram desenhados, vai para o intervalo
    	sw $9, 0($8)            # Salva o código da cor no endereço atual
    	addi $8, $8, 4          # Move para o próximo endereço
    	addi $11, $11, 1        # Incrementa o contador de pixels
    	j loopLinha3          # Repetição do loop para desenhar o traço

onda1intervalo3:
    	addi $8, $8, 36         # Adiciona 9 pixels de intervalo (9 * 4 = 36)
    	addi $13, $13, 1        # Incrementa o contador de traços
    	j loopTraco3          # Repetição do loop de traços
           	       	           	       	
# Sub-rotina para retornar para o ponto de chamada	
retorna:
	jr $31
