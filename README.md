# estagio_compass.uol


## 3. Criar e executar as consultas abaixo sobre o modelo de dados de uma Biblioteca:

### a) Listar todos os livros publicados após 2014

```sh
select Titulo, Publicacao from programa_bolsas.LIVRO
where Publicacao >= '2014-01-01'
order by Publicacao;

```
[Livros.csv](https://github.com/AriHenrique/estagio_compass.uol/files/9262079/Livros.csv)

### b) Listar os 10 livros mais caros
c) Listar as 5 editoras que mais tem livros na biblioteca
d) Listar a quantidade de publicações de cada autor
e) Listar a quantidade de publicações de cada editora
f) Listar qual é o autor com mais publicações
g) Listar qual é o autor com menos ou nenhuma publicação

4. Criar e executar as consultas abaixo sobre o modelo de dados de uma Loja:
a) selecione o nome e o código do vendedor com o maior número de vendas.
b) selecione o produto mais vendido entre as datas de 2014-02-03 até 2018-02-02.
c) calcule a comissão dos vendedores.
d) selecione o cliente que mais gastou.
e) selecione a escola que mais gastou.
f) selecione os 10 produtos menos vendidos por ecommerce e pela matriz.
g) calcule a média de gasto por estado.
h) selecione todos os registros deletados.
i) calcule a média da quantidade vendida de cada produto por estado.
j) selecione os gastos por dependente.