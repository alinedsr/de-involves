# Faça um script em Python que peça dois números e imprima a soma.

print("Olá!")
nome = str(input("Como você se chama? "))
print(f"Que bom ter você aqui, {nome}!")
while True:
    tipo = str(input("Você gostaria de somar números inteiros ou com casas decimais? Digite 'i' para inteiros ou 'd' para decimais. "))
    if tipo.lower() == "i":
        num1 = int(input("Digite o primeiro número inteiro: "))
        num2 = int(input("Digite o segundo número inteiro: "))
        soma = int(num1 + num2)
        print("A soma de", num1, "+", num2, "é igual a", soma)
    elif tipo.lower() == "d":
        num1 = float(input("Digite o primeiro número decimal: "))
        num2 = float(input("Digite o segundo número decimal: "))
        soma = float(num1 + num2)
        print("A soma de", num1, "+", num2, "é igual a", soma)
    else:
        print("Você não digitou uma opção válida.")
    opcao = input("Digite 'r' para reiniciar ou 's' para sair: ")
    if opcao.lower() == "r":
        continue
    elif opcao.lower() == "s":
        print("Até mais!")
        break
    else:
        print("A opção escolhida não é válida. O programa será encerrado agora.")
        break