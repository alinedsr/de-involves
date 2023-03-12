#Considere a instrução Python a seguir:
#x = [ print(i) for i in range(10) if i % 2 == 0 ]
#Após a execução dessa instrução no Python , a variável “x” conterá qual
#valor.

x = [ print(i) for i in range(10) if i % 2 == 0 ]

print("O valor de x é" , x)

# Ao executar a instrução fornecida, a função print será executada
# sempre que o resultado da iteração for verdadeiro.
# No caso, o comando "for i in range(10) if i % 2 == 0"
# trará verifica quais valores de 0 a 9 são pares. Com isso,
# a função print() será executada sempre que (i) for par, 
# retornando os valores 0, 2, 4, 6 e 8.
# Entretanto, após a execução da instrução, será atribuída à variável
# X uma lista contendo cinco vezes o valor "None", a seguir:
# [None, None, None, None, None], correspondendo aos cinco valores pares da verificação,
# e o valor "None" é atribuído pois a função print() não retorna nenhum valor.