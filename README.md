# estagio_compass.uol

# SPRINT 1
# Exercícios:
Para a realização dos exercícios (compass) considerar os seguintes passos:

## 1. Instalar e Configurar cliente SQL. Por exemplo: DBeaver, MySQL Workbench, Oracle SQL Developer…

### 2. Configurar conforme as informações abaixo:
### 1. SGBD: MySQL
### 2. URL: hive-metastore.cnpzwadswd70.us-east-1.rds.amazonaws.com
### 3. PORTA: 3306
### 4. USUÁRIO: programa_bolsas
### 5. SENHA: pb

## 3. Criar e executar as consultas abaixo sobre o modelo de dados de uma Biblioteca:

### a) Listar todos os livros publicados após 2014

```sh

select Titulo, Publicacao from programa_bolsas.LIVRO
where Publicacao >= '2014-01-01'
order by Publicacao;

```
[Livros.csv](https://github.com/AriHenrique/estagio_compass.uol/files/9262155/Livros.csv)

### b) Listar os 10 livros mais caros

```sh

select Titulo, Valor from programa_bolsas.LIVRO
order by 2 desc
limit 10;

```
[LivrosValorMax.csv](https://github.com/AriHenrique/estagio_compass.uol/files/9262480/LivrosValorMax.csv)

### c) Listar as 5 editoras que mais tem livros na biblioteca

```sh

select E.Nome, count(L.Publicacao) as Qtd_Publicacao from programa_bolsas.LIVRO L
inner join EDITORA E
on E.CodEditora = L.Editora
group by E.Nome 
order by count(L.Publicacao) desc
limit 5;

```

### d) Listar a quantidade de publicações de cada autor

```sh

select A.Nome, count(L.Publicacao) as Qtd_Publicacao from programa_bolsas.LIVRO L
inner join AUTOR A
on L.Autor = A.CodAutor
group by 1 
order by 2 desc;

```
### e) Listar a quantidade de publicações de cada editora

```sh

select count(L.Publicacao) as Qtd_Publicacao, E.Nome from programa_bolsas.LIVRO L
inner join EDITORA E
on L.Editora = E.CodEditora
group by 2 
order by 1 desc;

```
### f) Listar qual é o autor com mais publicações

```sh

select A.Nome, count(L.Publicacao) as Qtd_Publicacao from programa_bolsas.LIVRO L
inner join AUTOR A
on L.Autor = A.CodAutor
group by 1 
order by 2 desc
limit 1;

```
### g) Listar qual é o autor com menos ou nenhuma publicação

```sh

select A.Nome, L.Publicacao from programa_bolsas.LIVRO L
inner join AUTOR A
on L.Autor = A.CodAutor
order by L.Publicacao asc
limit 1;

```

## 4. Criar e executar as consultas abaixo sobre o modelo de dados de uma Loja:

### a) selecione o nome e o código do vendedor com o maior número de vendas.
```sh

```
### b) selecione o produto mais vendido entre as datas de 2014-02-03 até 2018-02-02.
```sh

```
### c) calcule a comissão dos vendedores.
```sh

```
### d) selecione o cliente que mais gastou.
```sh

```
### e) selecione a escola que mais gastou.
```sh

```
### f) selecione os 10 produtos menos vendidos por ecommerce e pela matriz.
```sh

```
### g) calcule a média de gasto por estado.
```sh

```
### h) selecione todos os registros deletados.
```sh

```
### i) calcule a média da quantidade vendida de cada produto por estado.
```sh

```
### j) selecione os gastos por dependente.
```sh

```