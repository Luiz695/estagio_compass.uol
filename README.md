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
where Valor >=
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

```sql
select E.Nome
     , count(L.Cod) as Qtd_Publicacao
from programa_bolsas.LIVRO L
         inner join
     programa_bolsas.EDITORA E
     on E.CodEditora = L.Editora
group by E.CodEditora
order by count(L.Cod) desc
limit 5;
```

```sql
select E.Nome
     , count(L.Cod) as Qtd_Publicacao
from programa_bolsas.LIVRO L
         inner join
     programa_bolsas.EDITORA E
     on E.CodEditora = L.Editora
group by E.CodEditora
having Qtd_Publicacao >=
       (select count(L.Cod) as Qtd_Publicacao
        from programa_bolsas.LIVRO L
                 inner join
             programa_bolsas.EDITORA E
             on E.CodEditora = L.Editora
        group by E.CodEditora
        order by count(L.Cod) desc
        limit 5, 1);
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
              , count(L.Publicacao) as Qtd_Pub
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
     , A.CodAutor
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
order by count(L.Publicacao)
limit 1;
```

## 4. Criar e executar as consultas abaixo sobre o modelo de dados de uma Loja:

### a) selecione o nome e o código do vendedor com o maior número de vendas.

```sql
select CdVdd
     , NmVdd
     , max(Qtd_Vendas)
from TbVendedor
         inner join
     (select count(Vdd.CdVdd) as Qtd_Vendas
      from programa_bolsas.TbVendedor Vdd
               inner join
           programa_bolsas.TbVendas V
           on Vdd.CdVdd = V.CdVdd
      where V.status = 'Concluído'
      group by Vdd.CdVdd) X
```

### b) selecione o produto mais vendido entre as datas de 2014-02-03 até 2018-02-02.

```sql
select CdPro
     , NmPro
     , max(MaisVendido) as MaisVendido
from TbVendas
         inner join
     (select sum(Qtd) as MaisVendido
      from TbVendas
      where (DtVen between '2014-02-03' and '2018-02-02')
        and (status = 'Concluído')
      group by CdPro) X
```

### c) calcule a comissão dos vendedores.

```sql
select A.NmVdd
     , A.CdVdd
     , round((sum(X.VendaTotal) * A.PercComissao / 100), 2) as Comissao
from (select CdVdd, NmPro, sum(Qtd) * VrUnt as VendaTotal
      from TbVendas
      where status = 'Concluído'
      group by CdPro, CdVdd) X
         inner join
     TbVendedor A
     on X.CdVdd = A.CdVdd
group by CdVdd
order by 2;
```

### d) selecione o cliente que mais gastou.

```sql
select *
     , case
           when TotalCompras = max(TotalCompras) then 'Cliente com maior gasto'
        end
        as 'RESULTADO'
from (select distinct NmCli, sum(Qtd) * VrUnt as TotalCompras
      from TbVendas
      where status = 'Concluído'
      group by CdCli
      order by 2 desc) X
```

### e) selecione a escola que mais gastou.

##### a tabela não possue relacao com outra ou nenhum valor para extrair esta informacao
```sql

```

### f) selecione os 10 produtos menos vendidos por ecommerce e pela matriz.

```sql
select CdPro
     , NmPro
     , count(CdPro) as Num_Vendas
     , NmCanalVendas
from TbVendas
group by CdPro, NmCanalVendas
order by 3
limit 10;
```

### g) calcule a média de gasto por estado.

```sql
SELECT Estado
     , ROUND(AVG(Qtd * VrUnt), 2) as MEDIA_GASTO_ESTADO
FROM TbVendas
where status = 'Concluído'
GROUP BY ESTADO
       , CdPro
order by 2 desc;
```

### h) selecione todos os registros deletados.

```sql
select *
from TbVendas
where deletado = 1
```

### i) calcule a média da quantidade vendida de cada produto por estado.

```sql
SELECT Estado
     , ROUND(AVG(Qtd), 2) as MEDIA_QTD_VEN_ESTADO
FROM TbVendas
where status = 'Concluído'
GROUP BY ESTADO
       , CdPro
order by 2 desc;
```

### j) selecione os gastos por dependente.

#### a tabela não possue relacao com outra ou nenhum valor para extrair esta informacao
```sql

```