
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
	
retorna:
	jr $31	
	
