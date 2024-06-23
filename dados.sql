-- Inserindo Dados na Tabela ENDERECOS:
insert into ENDERECO (LOGRADOURO, TIPO_LOG, COMPLEMENTO, CIDADE, UF, CEP, NUMERO, BAIRRO) values
('Rua um', 'Rua', 'Apto 101', 'Recife', 'PE', '52051', '100', 'Tamarineira'),
('Rua dois', 'Rua', 'Casa', 'Recife', 'PE', '52051', '200', 'Casa Amarela'),	
('Rua três', 'Rua', 'Casa', 'Recife', 'PE', '52051', '300', 'Casa Forte'),
('Rua quatro', 'Rua', 'Apto 202', 'Recife', 'PE', '52051', '400', 'Centro'),
('Rua cinco', 'Rua', 'Bloco A', 'Recife', 'PE', '52051', '500', 'Monteiro'),
('Rua seis', 'Rua', 'Apt. 302', 'Recife', 'PE', '52051', '6000', 'Rosarinho'),
('Rua sete', 'Rua', 'Apt 10', 'Recife', 'PE', '52051', '700', 'Espinheiro'),
('Rua oito', 'Rua', 'Apt 500', 'Recife', 'PE', '52051', '800', 'Campo Grande'),
('Rua nove', 'Rua', 'Casa', 'Recife', 'PE', '52051', '900', 'Torrões'),
('Rua dez', 'Rua', 'Apto 303', 'Recife', 'PE', '52051', '1000', 'Parnamirim');

-- Inserindo Dados na Tabela PROFISSOES:
insert into PROFISSAO (NOME) values
('Publicitária'),
('Advogado'),
('Professor'),
('Analista de Testes'),
('Programador'),
('Enfermeiro'),
('Medico'),
('Farmacêutico'),
('Dentista'),
('Jornalista');

-- Inserindo Dados na Tabela CLIENTES:
insert into CLIENTE (CPF, NOME, TELEFONE, FK_COD_PROF) values
('00000000000', 'Alana Maria', '81977444111', (select COD_PROF from PROFISSOES where NOME = 'Publicitária')),
('11111111111', 'Rodrigo Branco', '81987456321', (select COD_PROF from PROFISSOES where NOME = 'Advogado')),
('22222222222', 'Shuri Maria', '81963258741', (select COD_PROF from PROFISSOES where NOME = 'Professor')),
('33333333333', 'Andreza Menezes', '81954238746', (select COD_PROF from PROFISSOES where NOME = 'Analista de Testes')),
('44444444444', 'Giorgia Carina', '819523674189', (select COD_PROF from PROFISSOES where NOME = 'Programador')),
('55555555555', 'Marcus Vinicius', '81973218888', (select COD_PROF from PROFISSOES where NOME = 'Enfermeiro')),
('66666666666', 'Rafaella Alencar', '81912365899', (select COD_PROF from PROFISSOES where NOME = 'Medico')),
('77777777777', 'Andressa Alves', '81999996666', (select COD_PROF from PROFISSOES where NOME = 'Farmacêutico')),
('88888888888', 'Marcela Rodrigues', '81933377558', (select COD_PROF from PROFISSOES where NOME = 'Dentista')),
('99999999999', 'Juliana Silva', '81939865789', (select COD_PROF from PROFISSOES where NOME = 'Jornalista'));


-- Inserindo Dados na Tabela CLIENTES_ENDERECO:
insert into CLI_ENDERECO (FK_COD_END, FK_COD_CLI) values
((select COD_END from ENDERECOS where LOGRADOURO = 'Rua um' and NUMERO = '100'), (select COD_CLI from CLIENTES where NOME = 'Alana Maria')),
((select COD_END from ENDERECOS where LOGRADOURO = 'Rua dois' and NUMERO = '200'), (select COD_CLI from CLIENTES where NOME = 'Rodrigo Branco')),
((select COD_END from ENDERECOS where LOGRADOURO = 'Rua tres' and NUMERO = '300'), (select COD_CLI from CLIENTES where NOME = 'Shuri Maria')),
((select COD_END from ENDERECOS where LOGRADOURO = 'Rua quatro' and NUMERO = '400'), (select COD_CLI from CLIENTES where NOME = 'Andreza Menezes')),
((select COD_END from ENDERECOS where LOGRADOURO = 'Rua cinco' and NUMERO = '500'), (select COD_CLI from CLIENTES where NOME = 'Giorgia Carina')),
((select COD_END from ENDERECOS where LOGRADOURO = 'Rua seis' and NUMERO = '600'), (select COD_CLI from CLIENTES where NOME = 'Marcus Vinicius')),
((select COD_END from ENDERECOS where LOGRADOURO = 'Rua sete' and NUMERO = '700'), (select COD_CLI from CLIENTES where NOME = 'Rafaella Alencar')),
((select COD_END from ENDERECOS where LOGRADOURO = 'Rua sete' and NUMERO = '700'), (select COD_CLI from CLIENTES where NOME = 'Rafaella Alencar')),
((select COD_END from ENDERECOS where LOGRADOURO = 'Rua oito' and NUMERO = '800'), (select COD_CLI from CLIENTES where NOME = 'Andressa Alves')),
((select COD_END from ENDERECOS where LOGRADOURO = 'Rua oito' and NUMERO = '800'), (select COD_CLI from CLIENTES where NOME = 'Andressa Alves'));


-- Inserindo Dados na Tabela DEPENDENTES:
insert into DEPENDENTE (FK_COD_CLI, FK_COD_DEP, PARENTESCO) values
((select COD_CLI from CLIENTES where NOME = 'Alana Maria'), (select COD_CLI from CLIENTES where NOME = 'Salete Maria'), 'Mãe'),
((select COD_CLI from CLIENTES where NOME = 'Marcus Vinicius'), (select COD_CLI from CLIENTES where NOME = 'Ricardo Silva'), 'Filho');

-- Inserindo Dados na Tabela CATEGORIAS:
insert into CATEGORIA (NOME, VALOR) values
('Lançamento', 10.00),
('Padrão', 5.50),
('Clássico', 3.00);

-- Inserindo Dados na Tabela GENEROS:
insert into GENERO (NOME) values
('Ação'),
('Aventura'),
('Comédia'),
('Drama'),
('Fantasia'),
('Ficção Científica'),
('Super-herói');

-- Inserindo Dados na Tabela FILMES:
insert into FILMES (TITULO_ORIGINAL, TITULO, QUANTIDADE, FK_COD_CAT, FK_COD_GEN) values
('Furiosa: A Mad Max Saga.', 'Furiosa: A Mad Max Saga.', 2, (select COD_CAT from CATEGORIAS where NOME = 'Lançamento'), (select COD_GEN from GENEROS where NOME = 'Ação')),
('Bad Boys: Ride or Die', 'Bad Boys: Ride or Die', 3, (select COD_CAT from CATEGORIAS where NOME = 'Lançamento'), (select COD_GEN from GENEROS where NOME = 'Ação')),
('Challengers', 'Challengers', 2, (select COD_CAT from CATEGORIAS where NOME = 'Lançamento'), (select COD_GEN from GENEROS where NOME = 'Romance')),
('The Idea of You', 'The Idea of You', 4, (select COD_CAT from CATEGORIAS where NOME = 'Padrão'), (select COD_GEN from GENEROS where NOME = 'Romance')),
('Spider-Man: No Way Home', 'Spider-Man: No Way Home', 10, (select COD_CAT from CATEGORIAS where NOME = 'Padrão'), (select COD_GEN from GENEROS where NOME = 'Super-herói')),
('Os Vingadores', 'Os Vingadores', 6, (select COD_CAT from CATEGORIAS where NOME = 'Padrão'), (select COD_GEN from GENEROS where NOME= 'Super-herói')),
('Doutor Estranho', 'Doutor Estranho', 4, (select COD_CAT from CATEGORIAS where NOME = 'Padrão'), (select COD_GEN from GENEROS where NOME = 'Super-herói')),
('Matrix', 'Matrix', 4, (select COD_CAT from CATEGORIAS where NOME = 'Clássico'), (select COD_GEN from GENEROS where NOME = 'Ficção Científica')),
('Matrix Reloaded', 'Matrix Reloaded', 3, (select COD_CAT from CATEGORIAS where NOME = 'Clássico'), (select COD_GEN from GENEROS where NOME = 'Ficção Científica')),
('The Matrix Revolutions', 'The Matrix Revolutions', 2, (select COD_CAT from CATEGORIAS where NOME = 'Clássico'), (select COD_GEN from GENEROS where NOME = 'Ficção Científica')),
('Matrix Resurrections', ' Matrix Resurrections', 5, (select COD_CAT from CATEGORIAS where NOME = 'Clássico'), (select COD_GEN from GENEROS where NOME = 'Ficção Científica')),
('As Crônicas de Nárnia', 'As Crônicas de Nárnia', 7, (select COD_CAT from CATEGORIAS where NOME = 'Clássico'), (select COD_GEN from GENEROS where NOME = 'Aventura')),
('Todos Menos Você', 'Todos Menos Você', 10, (select COD_CAT from CATEGORIAS where NOME = 'Lançamento'), (select COD_GEN from GENEROS where NOME = 'Comédia')),
('Harry Potter e a Pedra Filosofal', 'Harry Potter e a Pedra Filosofal', 5, (select COD_CAT from CATEGORIAS where NOME = 'Clássico'), (select COD_GEN from GENEROS where NOME = 'Fantasia'));
('Harry Potter e a Câmara Secreta', 'Harry Potter e a Câmara Secreta', 1, (select COD_CAT from CATEGORIAS where NOME = 'Clássico'), (select COD_GEN from GENEROS where NOME = 'Fantasia')),

-- Inserindo Dados na Tabela LOCACOES:
insert into LOCACAO (DATA_LOC, DESCONTO, MULTA, SUB_TOTAL, FK_COD_CLI) values
('2024-06-01', 0.00, 2.00, 50.00, (select COD_CLI from CLIENTES where NOME = 'Rodrigo Branco')),
('2024-05-02', 0.00, 4.00, 30.00, (select COD_CLI from CLIENTES where NOME = 'Rafaella Alencar')),
('2024-04-03', 10.00, 0.00, 40.00, (select COD_CLI from CLIENTES where NOME = 'Marcus Vinicius')),
('2024-03-04', 0.00, 6.00, 50.00, (select COD_CLI from CLIENTES where NOME = 'Salete Maria')),
('2024-02-05', 5.00, 0.00, 60.00, (select COD_CLI from CLIENTES where NOME = 'Giorgia Carina')),
('2024-01-06', 0.00, 2.00, 70.00, (select COD_CLI from CLIENTES where NOME = 'Andreza Menezes'));


-- Inserindo Dados na Tabela LOCACAO_FILMES:
insert into LOCACAO_FILMES (FK_COD_LOC, FK_COD_FILME, VALOR, NUM_DIAS, DATA_DEVOL) values
((select COD_LOC from LOCACOES where DATA_LOC = '2024-06-01' and FK_COD_CLI = (select COD_CLI from CLIENTES where NOME = 'Rodrigo Branco')), (select COD_FILME from FILMES where TITULO = 'Bad Boys: Ride or Die'), 10.00, 3, '2024-06-03'),
((select COD_LOC from LOCACOES where DATA_LOC = '2024-05-02' and FK_COD_CLI = (select COD_CLI from CLIENTES where NOME = 'Rafaella Alencar')), (select COD_FILME from FILMES where TITULO = 'Matrix'), 3.00, 4, '2024-05-05'),
((select COD_LOC from LOCACOES where DATA_LOC = '2024-04-03' and FK_COD_CLI = (select COD_CLI from CLIENTES where NOME = 'Marcus Vinicius')), (select COD_FILME from FILMES where TITULO = 'As Crônicas de Nárnia'), 3.00, 3, '2024-04-06'),
((select COD_LOC from LOCACOES where DATA_LOC = '2024-03-04' and FK_COD_CLI = (select COD_CLI from CLIENTES where NOME = 'Salete Maria')), (select COD_FILME from FILMES where TITULO = 'Todos Menos Você'), 10.00, 3, '2024-03-07'),
((select COD_LOC from LOCACOES where DATA_LOC = '2024-02-05' and FK_COD_CLI = (select COD_CLI from CLIENTES where NOME = 'Giorgia Carina')), (select COD_FILME from FILMES where TITULO = 'Os Vingadores'), 5.50, 7, '2024-02-08'),
((select COD_LOC from LOCACOES where DATA_LOC = '2024-01-06' and FK_COD_CLI = (select COD_CLI from CLIENTES where NOME = 'Andreza Menezes')), (select COD_FILME from FILMES where TITULO = 'Challengers'), 20.00, 8, '2024-01-09');


-- Inserindo Dados na Tabela ATORES:
insert into ATOR (NOME) values
('Will Smith'),
('Keanu Reeves'),
('Tilda Swinton'),
('Glen Powell'),
('Scarlett Johansson'),
('Zendaya');

-- Inserindo Dados na Tabela FILMES_ATORES:
insert into FILME_ATOR (FK_COD_ATOR, FK_COD_FILME, ATOR, DIRETOR) values
((select COD_ATOR from FILME_ATOR where NOME = 'Will Smith'), (select COD_FILME from FILMES where TITULO = 'Bad Boys: Ride or Die'), 'S', 'N'),
((select COD_ATOR from FILME_ATOR where NOME = 'Keanu Reeves'), (select COD_FILME from FILMES where TITULO = 'Matrix'), 'S', 'S'),
((select COD_ATOR from FILME_ATOR where NOME = 'Glen Powell'), (select COD_FILME from FILMES where TITULO = 'Todos Menos Você'), 'S', 'N'),
((select COD_ATOR from FILME_ATOR where NOME = 'Scarlett Johansson'), (select COD_FILME from FILMES where TITULO = 'Os Vingadores'), 'S', 'N'),
((select COD_ATOR from FILME_ATOR where NOME = 'Zendaya'), (select COD_FILME from FILMES where TITULO = 'Challengers'), 'S', 'N');