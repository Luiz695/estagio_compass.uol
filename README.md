# estagio_compass.uol

# SPRINT 1
# Exercícios:
Para a realização dos exercícios (compass) considerar os seguintes passos:

## 1. Instalar e Configurar cliente SQL. Por exemplo: DBeaver, MySQL Workbench, Oracle SQL Developer…

## 2. Configurar conforme as informações abaixo:

#### 1. SGBD: MySQL
#### 2. URL: hive-metastore.cnpzwadswd70.us-east-1.rds.amazonaws.com
#### 3. PORTA: 3306
#### 4. USUÁRIO: programa_bolsas
#### 5. SENHA: pb

## 3. Criar e executar as consultas abaixo sobre o modelo de dados de uma Biblioteca:

### a) Listar todos os livros publicados após 2014

```sql
select Titulo
     , Publicacao
from programa_bolsas.LIVRO
where YEAR(Publicacao) >= 2014
order by 2;
```

### b) Listar os 10 livros mais caros

```sql
select Titulo
     , Valor
from programa_bolsas.LIVRO
order by 2 desc
limit 10;
```

```sql
select Valor
     , Titulo
from programa_bolsas.LIVRO
having Valor >=
       (select Valor
        from programa_bolsas.LIVRO
        order by 1 desc
        limit 10 ,1)
order by 1 desc;
```

### c) Listar as 5 editoras que mais tem livros na biblioteca

```sql
select E.Nome
     , count(L.Cod) as Qtd_Publicacao
from programa_bolsas.LIVRO L
         inner join
     programa_bolsas.EDITORA E
     on E.CodEditora = L.Editora
group by E.Nome
order by count(L.Cod) desc
limit 5;
```

### d) Listar a quantidade de publicações de cada autor

```sql
select A.Nome
     , count(L.Publicacao) as Qtd_Publicacao
from programa_bolsas.LIVRO L
         right join
     programa_bolsas.AUTOR A
     on L.Autor = A.CodAutor
group by A.CodAutor
order by 1;
```

### e) Listar a quantidade de publicações de cada editora

```sql
select distinct E.Nome
              , count(L.Publicacao) as Qtd_Publicacao
from programa_bolsas.LIVRO L
         left join
     programa_bolsas.EDITORA E
     on L.Editora = E.CodEditora
group by E.CodEditora
order by 1;
```

### f) Listar qual é o autor com mais publicações

```sql
select A.Nome
     , count(L.Publicacao) as Qtd_Publicacao
from programa_bolsas.LIVRO L
         left join
     programa_bolsas.AUTOR A
     on L.Autor = A.CodAutor
group by A.CodAutor
order by 2 desc;
```

### g) Listar qual é o autor com menos ou nenhuma publicação

```sql
select A.Nome
     , count(L.Publicacao) AS Qtd_Publicada
from programa_bolsas.AUTOR A
         left join
     programa_bolsas.LIVRO L
     on A.CodAutor = L.Autor
group by 1
having Qtd_Publicada = 0
order by 1;
```

```sql
select A.Nome
     , count(L.Publicacao) as Qtd_Publicacao
from programa_bolsas.LIVRO L
         inner join
     programa_bolsas.AUTOR A
     on L.Autor = A.CodAutor
group by A.CodAutor
order by count(L.Publicacao);
```

## 4. Criar e executar as consultas abaixo sobre o modelo de dados de uma Loja:

### a) selecione o nome e o código do vendedor com o maior número de vendas.
```sql

```
### b) selecione o produto mais vendido entre as datas de 2014-02-03 até 2018-02-02.
```sql

```
### c) calcule a comissão dos vendedores.
```sql

```
### d) selecione o cliente que mais gastou.
```sql

```
### e) selecione a escola que mais gastou.
```sql

```
### f) selecione os 10 produtos menos vendidos por ecommerce e pela matriz.
```sql

```
### g) calcule a média de gasto por estado.
```sql

```
### h) selecione todos os registros deletados.
```sql

```
### i) calcule a média da quantidade vendida de cada produto por estado.
```sql

```
### j) selecione os gastos por dependente.
```sql

```