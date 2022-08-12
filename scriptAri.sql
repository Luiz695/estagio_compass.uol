# 3. Criar e executar as consultas abaixo sobre o modelo de dados de uma Biblioteca:

# a) Listar todos os livros publicados após 2014

select Titulo
     , Publicacao
from programa_bolsas.LIVRO
where YEAR(Publicacao) >= 2014
order by 2;


# b) Listar os 10 livros mais caros

select Titulo
     , Valor
from programa_bolsas.LIVRO
order by 2 desc
limit 10;

select Valor
     , Titulo
from programa_bolsas.LIVRO
where Valor >=
      (select Valor
       from programa_bolsas.LIVRO
       order by 1 desc
       limit 10 ,1)
order by 1 desc;

# c) Listar as 5 editoras que mais tem livros na biblioteca

select E.Nome
     , count(L.Cod) as Qtd_Publicacao
from programa_bolsas.LIVRO L
         inner join
     programa_bolsas.EDITORA E
     on E.CodEditora = L.Editora
group by E.Nome
order by count(L.Cod) desc
limit 5;

select E.Nome
     , count(L.Cod) as Qtd_Publicacao
from programa_bolsas.LIVRO L
         inner join
     programa_bolsas.EDITORA E
     on E.CodEditora = L.Editora
group by E.CodEditora
order by count(L.Cod) desc
limit 5;

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

# d) Listar a quantidade de publicações de cada autor

select A.Nome
     , count(L.Publicacao) as Qtd_Publicacao
from programa_bolsas.LIVRO L
         right join
     programa_bolsas.AUTOR A
     on L.Autor = A.CodAutor
group by A.CodAutor
order by 1;

# e) Listar a quantidade de publicações de cada editora

select distinct E.Nome
              , count(L.Publicacao) as Qtd_Pub
from programa_bolsas.LIVRO L
         left join
     programa_bolsas.EDITORA E
     on L.Editora = E.CodEditora
group by E.CodEditora
order by 1;

# f) Listar qual é o autor com mais publicações

select A.Nome
     , count(L.Publicacao) as Qtd_Publicacao
from programa_bolsas.LIVRO L
         left join
     programa_bolsas.AUTOR A
     on L.Autor = A.CodAutor
group by A.CodAutor
order by 2 desc;

# g) Listar qual é o autor com menos ou nenhuma publicação

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

select A.Nome
     , count(L.Publicacao) as Qtd_Publicacao
from programa_bolsas.LIVRO L
         inner join
     programa_bolsas.AUTOR A
     on L.Autor = A.CodAutor
group by A.CodAutor
order by count(L.Publicacao)
limit 1;

# 4. Criar e executar as consultas abaixo sobre o modelo de dados de uma Loja:

# a) selecione o nome e o código do vendedor com o maior número de vendas.

select CdVdd
     , NmVdd
     , max(Qtd_Vendas)
from programa_bolsas.TbVendedor
         inner join
     (select count(Vdd.CdVdd) as Qtd_Vendas
      from programa_bolsas.TbVendedor Vdd
               inner join
           programa_bolsas.TbVendas V
           on Vdd.CdVdd = V.CdVdd
      where V.status = 'Concluído'
      group by Vdd.CdVdd) X;

# b) selecione o produto mais vendido entre as datas de 2014-02-03 até 2018-02-02.

select CdPro
     , NmPro
     , max(MaisVendido) as MaisVendido
from programa_bolsas.TbVendas
         inner join
     (select sum(Qtd) as MaisVendido
      from programa_bolsas.TbVendas
      where (DtVen between '2014-02-03' and '2018-02-02')
        and (status = 'Concluído')
      group by CdPro) X;

# c) calcule a comissão dos vendedores.

select A.NmVdd
     , A.CdVdd
     , round((sum(X.VendaTotal) * A.PercComissao / 100), 2) as Comissao
from (select CdVdd, NmPro, sum(Qtd) * VrUnt as VendaTotal
      from programa_bolsas.TbVendas
      where status = 'Concluído'
      group by CdPro, CdVdd) X
         inner join
     programa_bolsas.TbVendedor A
     on X.CdVdd = A.CdVdd
group by CdVdd
order by 2;

# d) selecione o cliente que mais gastou.

select *
     , case
           when TotalCompras = max(TotalCompras) then 'Cliente com maior gasto'
    end
    as 'RESULTADO'
from (select distinct NmCli, sum(Qtd) * VrUnt as TotalCompras
      from programa_bolsas.TbVendas
      where status = 'Concluído'
      group by CdCli
      order by 2 desc) X;

# e) selecione a escola que mais gastou.

# a tabela não possue relacao com outra ou nenhum valor para extrair esta informacao

# f) selecione os 10 produtos menos vendidos por ecommerce e pela matriz.

select CdPro
     , NmPro
     , count(CdPro) as Num_Vendas
     , NmCanalVendas
from programa_bolsas.TbVendas
group by CdPro, NmCanalVendas
order by 3
limit 10;

# g) calcule a média de gasto por estado.

select Estado
     , round(avg(Qtd * VrUnt), 2) as MEDIA_GASTO_ESTADO
from programa_bolsas.TbVendas
where status = 'Concluído'
group by ESTADO
       , CdPro
order by 2 desc;

# h) selecione todos os registros deletados.

select *
from programa_bolsas.TbVendas
where deletado = 1;

# i) calcule a média da quantidade vendida de cada produto por estado.

select Estado
     , round(avg(Qtd), 2) as MEDIA_QTD_VEN_ESTADO
from TbVendas
where status = 'Concluído'
group by ESTADO
       , CdPro
order by 2 desc;

# j) selecione os gastos por dependente.

#a tabela não possue relacao com outra ou nenhum valor para extrair esta informacao