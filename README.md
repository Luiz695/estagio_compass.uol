# estagio_compass.uol

# SPRINT 2

## Exercícios – Parte 1

### Exercício 1

Escreva um código Python que lê do teclado o nome e a idade de um usuário e imprime o ano em que o
usuário completará 100 anos.<br><br>
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
formato a seguir:<br><br>
Exemplo: 22/10/2022

```py
import datetime

a = datetime.datetime(int(input('Olá! Em que ano estamos?')), int(input('Qual mês?')), int(input('E qual dia?')))
print(a.strftime('Hoje é: %d/%m/%Y'))
```

## Exercícios – Parte 2

### Exercício 1

Dada duas listas como no exemplo abaixo:<br><br>
a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]<br>
b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]<br><br>
Escreve um programa que retorne o que as litas têm comum (sem repetições). O seu programa deve
funcionar para listas de qualquer tamanho.

```py

```

### Exercício 2

Dada a seguinte lista:<br><br>
a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]<br><br>
Faça um programa que gere uma nova lista contendo apenas números ímpares.


```py

```

### Exercício 3

Peça para o usuário digitar uma palavra pelo teclado e determina se a palavra digitada é ou não um
palíndromo. Um palíndromo é uma palavra que permanece igual se lida de traz pra frente.

```py

```

### Exercício 4

Dada as listas a seguir:<br><br>
primeirosNomes = ['Joao', 'Douglas', 'Lucas', 'José']<br>
sobreNomes = ['Soares', 'Souza', 'Silveira', 'Pedreira']<br>
idades = [19, 28, 25, 31]<br><br>
Faça um programa que imprima os dados na seguinte estrutura: " - está com anos"

```py

```

### Exercício 5

Escreva uma função que recebe uma lista e retorna uma nova lista sem elementos duplicados. Utilize um
exemplo para testar sua função.

```py

```

### Exercício 6

Escreva um programa que lê o conteúdo do arquivo texto arquivo_texto.txt e imprime o seu conteúdo.<br>
Dica: leia documentação da função open(...), [link](https://docs.python.org/3/library/functions.html#open) 

```py

```

### Exercício 7

Leia o arquivo person.json, faça o parsing e imprima seu conteúdo.<br>
Dica: leia a documentação do pacote json, [link](https://docs.python.org/3/library/json.html)

```py

```

### Exercício 8

Implemente a função my_map(list, f) que recebe uma lista como primeiro argumento e uma função como
segundo argumento. Esta função aplica a função recebida para cada elemento da lista recebida retorna o
resultado em uma nova lista.<br><br>
Teste sua função para saber se está ok.

```py

```

### Exercício 9

Escreva uma função que recebe um número variável de parâmetros não nomeados e um número variado de
parâmetros nomeados e imprime o <strong>valor</strong> de cada parâmetro recebido.


```py

```

### Exercício 10

Implemente a classe Lampada. A classe Lâmpada recebe um booleano no seu construtor, True se a lâmpada
estiver ligada, False caso esteja desligada. A classe Lampada possuí os seguintes métodos:<br><br>
• liga(): muda o estado da lâmpada para ligada<br>
• desliga(): muda o estado da lâmpada para desligada<br>
• esta_ligada(): retorna verdadeiro se a lâmpada estiver ligada, falso caso contrário


```py

```

### Exercício 11

Escreva um programa que leia do teclado uma sequência de número separados por vírgula (e.g. 2,4,5,6,1,6) e
imprime a soma de todos eles.

```py

```

### Exercício 12

Escreve uma função que recebe como parâmetro uma lista e retorna 3 listas: a lista recebida dividida em 3
partes iguais. Teste sua implementação<br><br>
b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]

```py

```

### Exercício 13

Dado o dicionário a seguir:<br><br>
speed = {'jan':47, 'feb':52, 'march':47, 'April':44, 'May':52, 'June':53, 'july':54, 'Aug':44, 'Sept':54}<br><br>
Crie uma lista com todos os <strong>valores</strong> (não as chaves!) e coloque numa lista de forma que não haja valores
duplicados.


```py

```

### Exercício 14

Calcule o valor mínimo, valor máximo, valor médio e a mediana da lista gerada na célula abaixo:<br>
Obs.: Lembrem-se, para calcular a mediana a lista deve estar <strong>ordenada</strong>!

```bat
import random
# amostra aleatoriamente 50 números do intervalo 0...500
random_list = random.sample(range(500), 50)
```

```py

```

### Exercício 15

Imprima a lista da célula abaixo de trás para frente.<br><br>
a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]

```py

```

