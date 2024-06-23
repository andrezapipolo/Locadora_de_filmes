-- Tabela ENDERECO
CREATE TABLE ENDERECO (
    COD_END serial primary key not null,
    LOGRADOURO varchar(40),
    TIPO_LOG varchar(40),
    COMPLEMENTO varchar(20),
    CIDADE varchar(60),
    UF varchar(2),
    CEP varchar(8),
    NUMERO varchar(10),
    BAIRRO varchar(60)
);

-- Tabela PROFISSAO
CREATE TABLE PROFISSAO (
    COD_PROF serial primary key not null,
    NOME varchar(60)
);

-- Tabela CLIENTE
CREATE TABLE CLIENTE (
    COD_CLI serial primary key not null,
    CPF VARCHAR(11),
    NOME VARCHAR(60),
    TELEFONE VARCHAR(10),
	FK_COD_PROF integer,
	foreign key (FK_COD_PROF) references PROFISSAO (COD_PROF)
	
);

-- Tabela CLI_ENDERECO
CREATE TABLE CLI_ENDERECO (
    FK_COD_END integer not null,
    FK_COD_CLI integer not null,
    primary key (FK_COD_END, FK_COD_CLI),
    foreign key (FK_COD_END) references ENDERECOS (COD_END),
    foreign key (FK_COD_CLI) references CLIENTES (COD_CLI)
);

-- Tabela DEPENDENTE
CREATE TABLE DEPENDENTE (
    FK_COD_CLI integer not null,
    FK_COD_DEP integer not null,
    PARENTESCO varchar(20),
	primary key (FK_COD_CLI, FK_COD_DEP),
    foreign key (FK_COD_CLI) references CLIENTES (COD_CLI),
	foreign key (FK_COD_DEP) references CLIENTES (COD_CLI)
);

-- Tabela CATEGORIA
CREATE TABLE CATEGORIA (
    COD_CAT serial primary key not null,
    NOME varchar(60),
    VALOR numeric(15,2)
);

-- Tabela GENERO
CREATE TABLE GENERO (
    COD_GEN serial primary key not null,
    NOME varchar(60)
);

-- Tabela FILMES
CREATE TABLE FILMES (
    COD_FILME serial primary key not null,
    TITULO_ORIGINAL varchar(100),
    TITULO varchar(100),
	QUANTIDADE integer,
	FK_COD_CAT integer not null,
    FK_COD_GEN integer not null,
    foreign key (FK_COD_CAT) references CATEGORIAS (COD_CAT),
    foreign key (FK_COD_GEN) references GENEROS (COD_GEN)
);

-- Tabela LOCACAO
CREATE TABLE LOCACAO (
    COD_LOC serial primary key not null,
    DATA_LOC date,
    DESCONTO numeric(15,2),
    MULTA numeric(15,2),
    SUB_TOTAL numeric(15,2),
	FK_COD_CLI integer not null,
    foreign key (FK_COD_CLI) references CLIENTES (COD_CLI)
);

-- Tabela LOCACAO_FILME
CREATE TABLE LOCACAO_FILME (
    FK_COD_LOC integer not null,
    FK_COD_FILME integer not null,
    VALOR numeric(15,2),
    NUM_DIAS integer,
    DATA_DEVOL date,
	primary key (FK_COD_LOC, FK_COD_FILME),
    foreign key (FK_COD_LOC) references LOCACOES (COD_LOC),
    foreign key (FK_COD_FILME) references FILMES (COD_FILME)
);

-- Tabela ATOR
CREATE TABLE ATOR (
    COD_ATOR serial primary key not null,
    NOME varchar(60)
);

-- Tabela FILME_ATOR
CREATE TABLE FILME_ATOR (
    FK_COD_ATOR integer not null,
    FK_COD_FILME integer not null,
	ATOR varchar(1),
    DIRETOR varchar(1),
	primary key (FK_COD_ATOR, FK_COD_FILME),
    foreign key (FK_COD_ATOR) references ATORES (COD_ATOR),
    foreign key (FK_COD_FILME) references FILMES (COD_FILME)

);
