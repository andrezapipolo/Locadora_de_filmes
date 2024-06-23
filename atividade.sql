-- LISTA DE EXERCÍCIOS

-- 1 
select C.NOME as Cliente, F.TITULO as Filme, L.DATA_LOC as DataLocacao, LF.DATA_DEVOL as DataDevolucao 
from CLIENTE C
join LOCACAO L on C.COD_CLI = L.FK_COD_CLI
join LOCACAO_FILMES LF on L.COD_LOC = LF.FK_COD_LOC
join FILMES F on LF.FK_COD_FILME = F.COD_FILME
where C.NOME = 'Nome';

-- 2 
select C.NOME as Cliente, D.NOME as Dependente, DEP.PARENTESCO as Parentesco 
from CLIENTE C
join DEPENDENTE DEP on C.COD_CLI = DEP.FK_COD_CLI
join CLIENTE D on DEP.FK_COD_DEP = D.COD_CLI;

-- 3 
select F.TITULO as Filme, G.NOME as Genero 
from FILME F
join GENERO G on F.FK_COD_GEN = G.COD_GEN
where G.NOME = 'genero';

-- 4 
select C.NOME as Cliente, P.NOME as Profissao
from CLIENTE C
join PROFISSAO P on C.FK_COD_PROF = P.COD_PROF
where P.NOME = 'profissao';

-- 5 
select F.TITULO as Filme, C.NOME as Categoria, F.QUANTIDADE as Quantidade 
from FILME F
join CATEGORIA C on F.FK_COD_CAT = C.COD_CAT
where C.NOME = 'categoria' and F.QUANTIDADE > 5;

-- 6 
select A.NOME as Ator, F.TITULO as Filme
from ATOR A
join FILME_ATOR FA on A.COD_ATOR = FA.FK_COD_ATOR
join FILMES F on FA.FK_COD_FILME = F.COD_FILME
where F.TITULO = 'titulo do filme';

-- 7 
select C.NOME as Cliente, E.LOGRADOURO || ', ' || E.NUMERO || ' - ' || E.COMPLEMENTO || ', ' || E.BAIRRO || ', ' || E.CIDADE || ' - ' || E.UF || ', ' || E.CEP as EnderecoCompleto
from CLIENTE C
join CLI_ENDERECO CE on C.COD_CLI = CE.FK_COD_CLI
join ENDERECO E on CE.FK_COD_END = E.COD_END
where C.NOME = 'cliente';

-- 8 
select F.TITULO as Filme, G.NOME as Genero, C.NOME as Categoria
from FILMES F
join GENERO G on F.FK_COD_GEN = G.COD_GEN
join CATEGORIA C on F.FK_COD_CAT = C.COD_CAT;

-- 9 M
select C.NOME as Cliente, F.TITULO as Filme, L.DATA_LOC as DataLocacao
from CLIENTE C
join LOCACAO L on C.COD_CLI = L.FK_COD_CLI
join LOCACAO_FILME LF on L.COD_LOC = LF.FK_COD_LOC
join FILMES F on LF.FK_COD_FILME = F.COD_FILME
where F.TITULO = 'titulo do filme';

-- 10 
select C.NOME as Cliente, L.MULTA as Multa
from CLIENTE C
join LOCACAO L on C.COD_CLI = L.FK_COD_CLI
where L.MULTA > ValorEspecifico;

-- 11 
select L.COD_LOC as LocacaoID, C.NOME as Cliente, L.DATA_LOC as DataLocacao
from LOCACAO L
join CLIENTE C on L.FK_COD_CLI = C.COD_CLI
where L.DATA_LOC between 'datainicio' and 'datafim';

-- 12 
select C.NOME as Cliente,
count (LF.FK_COD_FILME) as TotalFilmesAlugados
from CLIENTE C
join LOCACAO L on C.COD_CLI = L.FK_COD_CLI
join LOCACAO_FILME LF on L.COD_LOC = LF.FK_COD_LOC
group by C.NOME;

-- 13 
select C.NOME as Cliente, F.TITULO as Filme, L.DATA_LOC as DataLocacao
from CLIENTE C
join LOCACAO L on C.COD_CLI = L.FK_COD_CLI
join LOCACAO_FILME LF on L.COD_LOC = LF.FK_COD_LOC
join FILMES F on LF.FK_COD_FILME = F.COD_FILME
order by L.DATA_LOC;

-- 14 
select C.NOME as Cliente, F.TITULO as Filme, CA.NOME as Categoria
from CLIENTE C
join LI_ENDERECO CE on C.COD_CLI = CE.FK_COD_CLI
join ENDERECOS E on CE.FK_COD_END = E.COD_END
join LOCACAO L on C.COD_CLI = L.FK_COD_CLI
join LOCACAO_FILME LF on L.COD_LOC = LF.FK_COD_LOC
join FILMES F on LF.FK_COD_FILME = F.COD_FILME
join CATEGORIAS CA on F.FK_COD_CAT = CA.COD_CAT
where E.CIDADE = 'cidade' and CA.NOME = 'categoria ';

-- 15
count (FA.FK_COD_FILME) as NumFilmes
from ATOR A
join FILME_ATOR FA on A.COD_ATOR = FA.FK_COD_ATOR
group by A.NOME
having count (FA.FK_COD_FILME) >= 5;

-- 16 
count (LF.FK_COD_FILME) as TotalFilmesAlugados
from LOCACAO_FILME LF
join FILMES F on LF.FK_COD_FILME = F.COD_FILME
join CATEGORIA CA on F.FK_COD_CAT = CA.COD_CAT
join GENERO G on F.FK_COD_GEN = G.COD_GEN
group by CA.NOME, G.NOME
having count (LF.FK_COD_FILME) > 50;