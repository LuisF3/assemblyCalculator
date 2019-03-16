.data
.align 0
	 str_digi : .asciiz "digite qual operacao voce quer :  "
	 str_menu : .asciiz " 1 - soma\n 2 - subtracao\n 3 - multiplicacao\n 4 - divisao \n 5 - potenciacao \n 6 - raiz quadrada \n 7 - tabuada \n 8 - ICM \n 9 - Fatorial \n 10 - fibonacci \n 11 - Encerrar \n\n"
	 str_nume : .asciiz "\nentre com um numero: "
	 str_qpot : .asciiz "\na ser elevado a qual potencia:"
	 str_peso : .asciiz "\nentre com o peso da pessoa:"
	 str_altu : .asciiz "\nentre com a altura da pessoa:"
	 str_espa : .asciiz "\n"
	 str_povi : .asciiz " ; "
	 str_fiin : .asciiz "\nentre com o limite inferior : "
	 str_fisu : .asciiz "\nentre com o limite superior : "
	 
	 str_soma : .asciiz "o resultado da soma entre os dois numeros eh : "
	 str_subi : .asciiz "o resultado da subtracao entre os dois numeros eh : "
	 str_mult : .asciiz "o resultado da multiplicacao entre os dois numeros eh : "
	 str_quoc : .asciiz "o quociente da divisao entre os dois numeros eh : "
	 str_rest : .asciiz "\no resto da divisao eh :  "
	 str_pote : .asciiz "\na potencia desse numero eh :  "
	 str_raiz : .asciiz "\na raiz quadra desse numero eh : " 
	 str_nrai : .asciiz "\no numero nao apresenta raiz inteira"
	 str_tabu : .asciiz "\na tabuada do numero apresentado eh: "
	 str_imcc : .asciiz "\no imc da pessoa eh :  "
	 str_fato : .asciiz "\no fatoial do numero apresentado eh :  "
	 str_fibi : .asciiz "\no fibonacci no intervalo apresentada eh: "
	 
	 

.text
.globl main
	main:
		li $v0, 4	#print do menu
		la $a0, str_menu 
		syscall	
		
		li $v0, 4	#print pede escolher a opçao
		la $a0, str_digi
		syscall 
	
		
		li $v0, 5	#escaneando a opçao
		syscall
		move $t0, $v0  #salvando opçao em t0 = opçao
		
			li $t1, 1
			bgt $t0, $t1, not_soma # se apçao($t0) for maior q 1 quer dizer q
				     	       # nao eh uma soma logo pula oara not_soma
				      	       #precisei disso pq nao da para fazer jal
				       	       # em condicional
			jal Soma
			j the_end
		
		not_soma:
			li $t1, 2
			bgt $t0, $t1, not_subi 
			jal Subtracao
			j the_end
			
		not_subi:
			li $t1, 3
			bgt $t0, $t1, not_mult
			jal Multiplicacao
			j the_end
			
		not_mult:
			li $t1, 4
			bgt $t0, $t1, not_divi
			jal Divisao
			j the_end
		not_divi:
			li $t1, 5
			bgt $t0, $t1, not_pote
			jal Potencia
			j the_end
		not_pote:
			li $t1, 6
			bgt $t0, $t1, not_raiz
			jal raiz
			j the_end
		not_raiz:
			li $t1, 7
			bgt $t0, $t1, not_tabu
			jal tabuada
			j the_end
		not_tabu:
			li $t1, 8
			bgt $t0, $t1, not_imcc
			jal imc
			j the_end
		not_imcc:
			li $t1, 9
			bgt $t0, $t1, not_fato
			jal fatorial
			j the_end
		not_fato:
			li $t1, 10
			bgt $t0, $t1, the_end
			jal fibonacci
			j the_end
	
		the_end:
			li $v0, 10
			syscall
			
		
		Soma : 
			addi $sp, $sp, -8 #alocando o espaço de necessa
			sw $a0, 0($sp)
			sw $ra, 4($sp)
			
			li $v0, 4
			la $a0, str_nume #solicitando numero de entrada
			syscall
			
			li $v0, 5  
			syscall		#repassando para $t2
			move $t2, $v0
			
			
			li $v0, 4
			la $a0, str_nume #solicitando numero de entrada
			syscall
			
			li $v0, 5 
			syscall
			move $t3, $v0 	  #repassando para $t3
			
			add $t2, $t2, $t3 #adicionando numeros de entrada armazenando em $t2
			
			li $v0, 4
			la $a0, str_soma  # o resultado na soma eh : 
			syscall
			
			li $v0, 1
			move $a0, $t2  	  # printando soma
			syscall
			
			lw $a0, 0($sp)
			lw $ra, 4($sp)
			addi $sp, $sp, 8
			jr $ra
			
		Subtracao: 
			addi $sp, $sp, -8 #alocando o espaço de necessa
			sw $a0, 0($sp)
			sw $ra, 4($sp)
			
			li $v0, 4
			la $a0, str_nume #solicitando numero de entrada
			syscall
			
			li $v0, 5  
			syscall		#repassando para $t2
			move $t2, $v0
			
			
			li $v0, 4
			la $a0, str_nume #solicitando numero de entrada
			syscall
			
			li $v0, 5 
			syscall
			move $t3, $v0 	  #repassando para $t3
			
			sub $t2, $t2, $t3 #subtraindo numeros de entrada armazenando em $t2
			
			li $v0, 4
			la $a0, str_soma  # o resultado na subtracao eh : 
			syscall
			
			li $v0, 1
			move $a0, $t2  	  # printando subtracao
			syscall
			
			lw $a0, 0($sp)
			lw $ra, 4($sp)
			addi $sp, $sp, 8
			jr $ra
			
		Multiplicacao : 
			addi $sp, $sp, -8 #alocando o espaço de necessa
			sw $a0, 0($sp)
			sw $ra, 4($sp)
			
			li $v0, 4
			la $a0, str_nume #solicitando numero de entrada
			syscall
			
			li $v0, 5  
			syscall		#repassando para $t2
			move $t2, $v0
			
			
			li $v0, 4
			la $a0, str_nume #solicitando numero de entrada
			syscall
			
			li $v0, 5 
			syscall
			move $t3, $v0 	  #repassando para $t3
			
			mul $t2, $t2, $t3 #mutiplicando numeros de entrada armazenando em $t2
			
			li $v0, 4
			la $a0, str_soma  # o resultado na multiplicacao eh : 
			syscall
			
			li $v0, 1
			move $a0, $t2  	  # printando multiplicacao
			syscall
			
			lw $a0, 0($sp)
			lw $ra, 4($sp)
			addi $sp, $sp, 8
			jr $ra
			
		Divisao : 
			addi $sp, $sp, -8 #alocando o espaço de necessa
			sw $a0, 0($sp)
			sw $ra, 4($sp)
			
			li $v0, 4
			la $a0, str_nume #solicitando numero de entrada
			syscall
			
			li $v0, 5  
			syscall		#repassando para $t2
			move $t2, $v0
			
			
			li $v0, 4
			la $a0, str_nume #solicitando numero de entrada
			syscall
			
			li $v0, 5 
			syscall
			move $t3, $v0 	  #repassando para $t3
			
			div $t2, $t3 # dividindo numeros de entrada armazenando em $t2
			mflo $t4
			mfhi $t5
			
			li $v0, 4
			la $a0, str_quoc # o quociente eh: 
			syscall
			
			li $v0, 1
			move $a0, $t3  	  # print quociente
			syscall
			
			li $v0, 4
			la $a0, str_rest # o resto eh: 
			syscall
			
			li $v0, 1
			move $a0, $t4  	  # print resto
			syscall
			
			lw $a0, 0($sp)
			lw $ra, 4($sp)
			addi $sp, $sp, 8
			jr $ra
		
		Potencia :
			addi $sp, $sp, -8 #alocando o espaço de necessa
			sw $a0, 0($sp)
			sw $ra, 4($sp)
			
			li $v0, 4
			la $a0, str_nume #solicitando numero de entrada
			syscall
			
			li $v0, 5  	#numero a ser elevado
			syscall		#repassando para $t2
			move $t2, $v0
			
			
			li $v0, 4
			la $a0, str_qpot #solicitando numero de entrada
			syscall
			
			li $v0, 5 	  # $t3 expoente
			syscall
			move $t3, $v0 	  #repassando para $t3
			li $t4, 1 	  # $t4 auxiliar que sera a saida
			
			beq $t3, $zero end_zero #elevado a zero
			
			loop:
			
				ble $t3, $zero, end_loop_pot #se caounter < 0 
						 	# então sai do loop
				mul $t4, $t4 ,$t2	#$t2 se mantem
							#$t4 muda
				addi $t3, $t3, -1
				
				j loop
			end_zero:
				li $v0, 4
				la $a0, str_pote # a potencia eh:  
				syscall
			
				li $v0, 1
				li $a0, 1  	#printa a potencia de a zero
				syscall
				j end_sis_pot
			
			
			end_loop_pot:
				li $v0, 4
				la $a0, str_pote # a potencia eh :
				syscall
			
				li $v0, 1
				move $a0, $t4  	  # potencia
				syscall
			
			
			end_sis_pot:
			
				lw $a0, 0($sp)
				lw $ra, 4($sp)
				addi $sp, $sp, 8
				jr $ra
		
		raiz : 
			addi $sp, $sp, -8 #alocando o espaço de necessa
			sw $a0, 0($sp)
			sw $ra, 4($sp)
			
			li $v0, 4
			la $a0, str_nume #solicitando numero de entrada para a 
					 # fazer a raiz quadrada
			syscall
			
			li $v0, 5  
			syscall		#repassando para $t2
			move $t2, $v0
			
			li $t3, 1 #repassando a menor variavel para q seja raiz
			
			
			loop_raiz:
				mul $t4, $t3, $t3 	# $t4 é $t3 ao qudrado
				beq $t4, $t2, end_craiz # se $t4 for igual a 
						       	# $t2 entao $t3 e a raiz
						       	
				bgt $t4, $t2, end_sraiz # se $t4 > $t2
							# nao tem raiz
				addi $t3, $t3, 1 
				j loop_raiz
			
			
			end_craiz: 
				
				li $v0, 4
				la $a0, str_raiz # a raiz o numero eh:
				syscall
			
				li $v0, 1
				move $a0, $t3  	  # print raiz
				syscall
				j end_raiz_f
				
			end_sraiz:
				li $v0, 4
				la $a0, str_nrai # a sem raiz
				syscall
			
			end_raiz_f:
		
				lw $a0, 0($sp)
				lw $ra, 4($sp)
				addi $sp, $sp, 8
				jr $ra
		tabuada: 
			addi $sp, $sp, -8 #alocando o espaço de necessa
			sw $a0, 0($sp)
			sw $ra, 4($sp)
			
			li $v0, 4
			la $a0, str_nume #solicitando numero de entrada para a 
					
			syscall
			
			li $v0, 5  
			syscall		#repassando para $t2
			move $t2, $v0
			
			li $t3, 0  # contador
			li $t4, 10 # valor constante q determinada fim do loop
			
			li $v0, 4
			la $a0, str_tabu #imprime tabuada
			syscall
			
			
			loop_tabu:
				
						  #multiplica valor de entrada
						  #pelo contador
				mul $t5, $t2, $t3 # $t5 valor a ser
						  # printado da tabuada
						  # variavel auxiliar
				
				li $v0, 4
				la $a0, str_espa #imprime espaço
				syscall
				
				li $v0, 1
				move $a0, $t5  	  # a tabuada
				syscall
				
				addi $t3, $t3, 1 
				
				bgt $t3, $t4, end_tabu 	#verifica se o contador 
						    	# eh maior q "10"
				
				  
				j loop_tabu
			
			
			
				
			
			
			end_tabu:
		
				lw $a0, 0($sp)
				lw $ra, 4($sp)
				addi $sp, $sp, 8
				jr $ra
		imc: 
			addi $sp, $sp, -8 #alocando o espaço de necessa
			sw $a0, 0($sp)
			sw $ra, 4($sp)
			
			li $v0, 4
			la $a0, str_peso #solicitando peso	 
			syscall
			
			li $v0, 6  	#valor fica em $f0
			syscall		 
			mov.s $f1, $f0	#repassa para $f1
			
			li $v0, 4
			la $a0, str_altu #solicitando pela altura					
			syscall
			
			li $v0, 6  
			syscall		
			mov.s $f2, $f0	#repassando a altura para $f2
			
			mul.s $f2, $f2, $f2 # elevando a altura ao quadrado
			div.s $f1, $f1, $f2 # f0 rescebe a divisao entre 
					    # f0 e f1  
			
			li $v0, 4
			la $a0, str_imcc
			syscall
			
			li $v0, 2
			mov.s $f12, $f1
			syscall
			
			
			lw $a0, 0($sp)
			lw $ra, 4($sp)
			addi $sp, $sp, 8
			jr $ra
		
		fatorial: 
			addi $sp, $sp, -8 #alocando o espaço de necessa
			sw $a0, 0($sp)
			sw $ra, 4($sp)
			
			li $v0, 4
			la $a0, str_nume	 
			syscall
			
			li $v0, 5  	
			syscall		 
			move $t1, $v0	# numero que devemos fazer o fatorial			
			move $t2, $v0 	#variavel auxiliar, counter   
			li $t3, 1	#constante 
			
			loop_fat:
				addi $t2, $t2, -1	# descendo o $t2
				ble $t2, $t3, end_fat 	# counter < 1 ele sai
				mul $t1, $t1, $t2	# passando a multiplicacao
							# armazena em $t1
				j loop_fat							
			  
			end_fat:
			
				li $v0, 4
				la $a0, str_fato
				syscall
			
				li $v0, 1
				move $a0, $t1
				syscall
			
			
				lw $a0, 0($sp)
				lw $ra, 4($sp)
				addi $sp, $sp, 8
				jr $ra
		fibonacci: 
			addi $sp, $sp, -8 #alocando o espaço de necessa
			sw $a0, 0($sp)
			sw $ra, 4($sp)
			
			li $v0, 4
			la $a0, str_fiin	 
			syscall
			
			li $v0, 5  	
			syscall		 
			move $t1, $v0	#precisa printar entre $t1
			
			li $v0, 4
			la $a0, str_fisu	 
			syscall
			
			li $v0, 5  	
			syscall		 
			move $t2, $v0	# e entre $t2
			
			#
 		#int a = 1;
		#int b = 1;
		#int var = 1;
		#// scanf("%d",&c);
		#// scanf("%d",&d);
		#for (int i = 0; var < 100; ++i)
		#{
		#	a = a + b;
		#	var = a;
		#	printf("%d , ", var);
		#	b = b + a;
		#	var = b;
		##	printf("%d , ", var);
		#}
 			li $t3, 1 # $t3 eh o equivalente a 'a'
 			li $t4, 1 # $t4 eh o equivalente a 'b'
 			li $t5, 1 # $t5 eh o equivalente a 'var'
 			
 			li $v0, 4
			la $a0, str_fibi
			syscall
			
			beq $t1, $t3 ,star_with_one # precisamos fazer primeiro
						    # eh printar 1 ; 1
						    # pois o limite inferior eh 1
 			
			loop_fib:
				add $t3, $t3, $t4 	# a = a + b
				move $t5 , $t3	 	# var = a
				bgt $t5, $t2, end_fib 	# se $t5 > $t2 entao termina
				bge $t5, $t1, print_var # senao, verifica se eh maior 
							# q o $t1, se for printa
			part_two:			
				add $t4, $t3, $t4 	# b = b + a
				move $t5 , $t4		# var = b
				bgt $t5, $t2, end_fib	# se $t5 > $t2 entao termina
				bge $t5, $t1, print_var # senao, verifica se eh maior
							# q o $t1 e printa
				j loop_fib
			print_var:
				li $v0, 1
				move $a0, $t5
				syscall
					
				li $v0, 4
				la $a0, str_povi
				syscall
							# a > b , quer dizer a autima coisa
							# que fizemos foi a = a +b
				bge $t3 , $t4, part_two #se a > b entao pula para parte 2 se nao
				j loop_fib		#pula para loop feeb
						
			end_fib:
						
				lw $a0, 0($sp)
				lw $ra, 4($sp)
				addi $sp, $sp, 8
				jr $ra
			star_with_one:
				li $v0, 1
				move $a0, $t3
				syscall
					
				li $v0, 4
				la $a0, str_povi
				syscall
				
				li $v0, 1
				move $a0, $t3
				syscall
					
				li $v0, 4
				la $a0, str_povi
				syscall
				
				j loop_fib
		
		
		
