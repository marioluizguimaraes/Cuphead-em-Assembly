.text

main:
  	lui $8, 0x1001 	# Primeiro endereço de memoria
    
  	# Criaçao do ceu
  	ori $9, $0, 0xfff2cc  	# codigo da cor
  	li $10, 32768   		# Numero de unidade de pexels 
  	li $11, 0       		# Contador

forCeu: 
  	beq $11, $10, end 	# Verificador de condiçao
     
  	# Guardando na memoria
  	sw $9, 0($8)		# Adicionar o codigo do $9 no endereço de memoria apontado pelo $8
  
  	# Proximo endereço de memoria
  	addi $8, $8, 4	# Adiciona +4
  
  	# Incremento  
  	addi $11, $11, 1	# Soma +1 no conador
  	j forCeu
     
    
end:
  	addi $2, $0, 10
  	syscall