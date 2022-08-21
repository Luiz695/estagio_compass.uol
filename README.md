# estagio_compass.uol

# SPRINT 2

## Exercícios – Parte 1

### Exercício 1

Escreva um código Python que lê do teclado o nome e a idade de um usuário e imprime o ano em que o
usuário completará 100 anos.
Dica: você pode ler strings digitadas no teclado utilizando a função builtin input('mensagem'). Lembre-se de
converter números para seu respectivo tipo (int ou float) antes fazer operações aritméticas.

```py
from datetime import date
nome = str(input("Qual o seu nome?"))
idade = int(input(f'Bem-vindo(a) {nome}, agora me fala... qual a sua idade?'))
data_atual = date.today()
ano_nascimento = data_atual.year - idade
print(f'Então quer dizer que em {ano_nascimento + 100} você terá 100 anos lol!!!')
```

### Exercício 2

Escreva um código Python que lê do teclado um número digitado pelo usuário e imprime se ele par ou ímpar

```py
x = int(input('Bem-vindo, Digite um número e descubra se ele é PAR ou ÍMPAR'))
if x % 2 == 0:
    print(f'{x} é PAR')
else:
    print(f'{x} é ÍMPAR')
```

### Exercício 3

Escreva um código Python que imprime os números pares de 0 até 20 (incluso).
Dica: olhe a documentação da função range(). Mais informações no [link](https://docs.python.org/3/library/functions.html#func-range)

```py
num = int(input("Digite quantos números quer testar"))
for i in range(0,num + 1):
    if i % 2 == 0:
        print(f'{i} é PAR')
    else:
        print(f'{i} é ÍMPAR')
```

### Exercício 4

Escreva um código Python que imprime todos os números primos de 0 até 100.

```py
limit = int(input("Digite o número max"))
number = 0
while number < limit:
    if number > 1:
        for i in range(2, number):
            if number % i == 0:
                break
        else:
            print(number, 'é primo')
    number += 1
```

### Exercício 5

Escreva um código Python que lê do teclado um dia, um mês e um ano e imprime a data completa no
formato a seguir:
Exemplo: 22/10/2022

```py
import datetime

a = datetime.datetime(int(input('Olá! Em que ano estamos?')), int(input('Qual mês?')), int(input('E qual dia?')))
print(a.strftime('Hoje é: %d/%m/%Y'))
```


