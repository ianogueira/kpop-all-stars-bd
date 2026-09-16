CREATE TABLE Conglomerados(
    id_conglomerado NUMBER PRIMARY KEY NOT NULL,
    nome VARCHAR2(100) NOT NULL
);

INSERT INTO Conglomerados(id_conglomerado, nome) VALUES (1, 'HYBE');

CREATE TABLE Premios (
    id_premio NUMBER PRIMARY KEY NOT NULL,
    nome VARCHAR2(100) NOT NULL
); 

INSERT INTO Premios (id_premio, nome)
VALUES
	(1, 'Artista do Ano'),
	(2, 'Canção do Ano'),
	(3, 'Álbum do Ano'),
	(4, 'Melhor Grupo Masculino'),
	(5, 'Melhor Grupo Feminino'),
	(6, 'Melhor Grupo Masculino Novo'),
	(7, 'Melhor Grupo Feminino Novo');
    
CREATE TABLE Papeis(
    id_papel NUMBER PRIMARY KEY NOT NULL,
    nome VARCHAR2(100) NOT NULL,
    descricao VARCHAR2(200) NOT NULL
);

INSERT INTO Papeis (id_papel, nome, descricao)
VALUES
	(1, 'Leader', 'Integrante que lidera o grupo'),
	(2, 'Rapper', 'Integrante responsável pelo rap'),
	(3, 'Visual', 'Integrante considerado mais atraente, representa a face do grupo'),
	(4, 'Vocalist', 'Integrante responsável pela voz, vocais'),
	(5, 'Maknae', 'Integrante mais novo do grupo'),
	(6, 'Dancer', 'Integrante responsável pela dança'),
	(7, 'Center', 'Integrante que fica, na maior parte, no centro da coreografia');

INSERT INTO Papeis (id_papel, nome, descricao) VALUES (8, 'Soloist', 'Em atividade Solo');

CREATE TABLE Empresas (
    id_empresa NUMBER PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    valor_de_mercado NUMBER(10,2) DEFAULT 0.00,
    id_conglomerado NUMBER,
    CONSTRAINT fk_conglomerado FOREIGN KEY (id_conglomerado) REFERENCES Conglomerados(id_conglomerado) ON DELETE CASCADE
);

INSERT INTO Empresas (id_empresa, nome, id_conglomerado) 
VALUES 
    (1, 'Source Ent.', (SELECT id_conglomerado FROM Conglomerados WHERE nome = 'HYBE')),
    (2, 'Pledis Ent.', (SELECT id_conglomerado FROM Conglomerados WHERE nome = 'HYBE')),
    (3, 'SM Ent.', (SELECT id_conglomerado FROM Conglomerados WHERE id_conglomerado = 0));

CREATE INDEX idx_empresas_conglomerado_id ON Empresas(id_conglomerado);

CREATE TABLE Grupos(
    id_grupo NUMBER PRIMARY KEY,
    id_empresa NUMBER NOT NULL,
    nome VARCHAR2(100) NOT NULL,
    disbanded VARCHAR2(1) CHECK (disbanded IN ('T', 'F')) NOT NULL,
    debute DATE,
    CONSTRAINT fk_id_empresa FOREIGN KEY (id_empresa) REFERENCES Empresas(id_empresa) ON DELETE CASCADE
);

INSERT INTO Grupos (id_grupo, id_empresa, nome, disbanded, debute) VALUES  
    (1, (SELECT id_empresa FROM Empresas WHERE nome = 'SM Ent.'), 'SuperJunior', 'F', TO_DATE('2005-11-06', 'YYYY-MM-DD')),
    (2, (SELECT id_empresa FROM Empresas WHERE nome = 'SM Ent.'), 'Red Velvet', 'F', TO_DATE('2014-08-01', 'YYYY-MM-DD')), 
    (3, (SELECT id_empresa FROM Empresas WHERE nome = 'SM Ent.'), 'aespa', 'F', TO_DATE('2020-11-17', 'YYYY-MM-DD')),
    (4, (SELECT id_empresa FROM Empresas WHERE nome = 'Pledis Ent.'), 'AfterSchool', 'T', TO_DATE('2009-01-17', 'YYYY-MM-DD')),
    (5, (SELECT id_empresa FROM Empresas WHERE nome = 'Pledis Ent.'), 'Pristin', 'T', TO_DATE('2017-03-21', 'YYYY-MM-DD')),
    (6, (SELECT id_empresa FROM Empresas WHERE nome = 'Source Ent.'), 'Le Serafim', 'F', TO_DATE('2022-05-02', 'YYYY-MM-DD'));

CREATE INDEX idx_empresas_grupo_id ON grupos(id_empresa);

CREATE TABLE Artistas (
    id_artista NUMBER PRIMARY KEY,
    id_grupo NUMBER,
    id_papel NUMBER, 
    nome VARCHAR2(100) NOT NULL,
    ativo VARCHAR2(1) CHECK (ativo IN ('T', 'F')) NOT NULL,
    meses_treino NUMBER(3) NOT NULL,
    debute DATE,
    CONSTRAINT fk_artista FOREIGN KEY (id_grupo) REFERENCES Grupos(id_grupo) ON DELETE CASCADE,
    CONSTRAINT fk_papel FOREIGN KEY (id_papel) REFERENCES Papeis(id_papel) ON DELETE CASCADE
);

INSERT INTO Artistas (id_artista, id_grupo, nome, ativo, meses_treino, id_papel, debute) VALUES 
    (1, (SELECT id_grupo FROM Grupos WHERE nome = 'Red Velvet'), 'Irene', 'T', 24, (SELECT id_papel FROM Papeis WHERE nome = 'Leader'), TO_DATE('2014-08-01', 'YYYY-MM-DD')),
    (2, (SELECT id_grupo FROM Grupos WHERE nome = 'Red Velvet'), 'Yeri', 'T', 18, (SELECT id_papel FROM Papeis WHERE nome = 'Maknae'), TO_DATE('2015-03-11', 'YYYY-MM-DD')),
    (3, (SELECT id_grupo FROM Grupos WHERE nome = 'Red Velvet'), 'Wendy', 'T', 36, (SELECT id_papel FROM Papeis WHERE nome = 'Vocalist'), TO_DATE('2014-08-01', 'YYYY-MM-DD')),
    (4, (SELECT id_grupo FROM Grupos WHERE nome = 'Red Velvet'), 'Seulgi', 'T', 48, (SELECT id_papel FROM Papeis WHERE nome = 'Dancer'), TO_DATE('2014-08-01', 'YYYY-MM-DD')),
    (5, (SELECT id_grupo FROM Grupos WHERE nome = 'Red Velvet'), 'Joy', 'T', 24, (SELECT id_papel FROM Papeis WHERE nome = 'Vocalist'), TO_DATE('2014-08-01', 'YYYY-MM-DD'));

INSERT INTO Artistas (id_artista, id_grupo, nome, ativo, meses_treino, id_papel, debute) VALUES 
    (6, (SELECT id_grupo FROM Grupos WHERE nome = 'SuperJunior'), 'Leeteuk', 'T', 60, (SELECT id_papel FROM Papeis WHERE nome = 'Leader'), TO_DATE('2005-11-06', 'YYYY-MM-DD')),
    (7, (SELECT id_grupo FROM Grupos WHERE nome = 'SuperJunior'), 'Heechul', 'T', 48, (SELECT id_papel FROM Papeis WHERE nome = 'Vocalist'), TO_DATE('2005-11-06', 'YYYY-MM-DD')),
    (8, (SELECT id_grupo FROM Grupos WHERE nome = 'SuperJunior'), 'Yesung', 'T', 48, (SELECT id_papel FROM Papeis WHERE nome = 'Vocalist'), TO_DATE('2005-11-06', 'YYYY-MM-DD')),
    (9, (SELECT id_grupo FROM Grupos WHERE nome = 'SuperJunior'), 'Kangin', 'T', 48, (SELECT id_papel FROM Papeis WHERE nome = 'Vocalist'), TO_DATE('2005-11-06', 'YYYY-MM-DD')),
    (10, (SELECT id_grupo FROM Grupos WHERE nome = 'SuperJunior'), 'Shindong', 'T', 48, (SELECT id_papel FROM Papeis WHERE nome = 'Dancer'), TO_DATE('2005-11-06', 'YYYY-MM-DD')),
    (11, (SELECT id_grupo FROM Grupos WHERE nome = 'SuperJunior'), 'Sungmin', 'T', 48, (SELECT id_papel FROM Papeis WHERE nome = 'Vocalist'), TO_DATE('2005-11-06', 'YYYY-MM-DD')),
    (12, (SELECT id_grupo FROM Grupos WHERE nome = 'SuperJunior'), 'Eunhyuk', 'T', 48, (SELECT id_papel FROM Papeis WHERE nome = 'Dancer'), TO_DATE('2005-11-06', 'YYYY-MM-DD')),
    (13, (SELECT id_grupo FROM Grupos WHERE nome = 'SuperJunior'), 'Donghae', 'T', 48, (SELECT id_papel FROM Papeis WHERE nome = 'Vocalist'), TO_DATE('2005-11-06', 'YYYY-MM-DD')),
    (14, (SELECT id_grupo FROM Grupos WHERE nome = 'SuperJunior'), 'Siwon', 'T', 48, (SELECT id_papel FROM Papeis WHERE nome = 'Vocalist'), TO_DATE('2005-11-06', 'YYYY-MM-DD')),
    (15, (SELECT id_grupo FROM Grupos WHERE nome = 'SuperJunior'), 'Ryeowook', 'T', 48, (SELECT id_papel FROM Papeis WHERE nome = 'Vocalist'), TO_DATE('2005-11-06', 'YYYY-MM-DD')),
    (16, (SELECT id_grupo FROM Grupos WHERE nome = 'SuperJunior'), 'Kyuhyun', 'T', 48, (SELECT id_papel FROM Papeis WHERE nome = 'Vocalist'), TO_DATE('2006-05-27', 'YYYY-MM-DD')),
    (17, (SELECT id_grupo FROM Grupos WHERE nome = 'SuperJunior'), 'Han Geng', 'F', 48, (SELECT id_papel FROM Papeis WHERE nome = 'Dancer'), TO_DATE('2005-11-06', 'YYYY-MM-DD')),
    (18, (SELECT id_grupo FROM Grupos WHERE nome = 'SuperJunior'), 'Kibum', 'F', 48, (SELECT id_papel FROM Papeis WHERE nome = 'Vocalist'), TO_DATE('2005-11-06', 'YYYY-MM-DD'));

INSERT INTO Artistas (id_artista, id_grupo, nome, ativo, meses_treino, id_papel, debute) VALUES 
    (19, (SELECT id_grupo FROM Grupos WHERE nome = 'Le Serafim'), 'Miyawaki Sakura', 'T', 48, (SELECT id_papel FROM Papeis WHERE nome = 'Leader'), TO_DATE('2022-05-02', 'YYYY-MM-DD')),
    (20, (SELECT id_grupo FROM Grupos WHERE nome = 'Le Serafim'), 'Kim Chae-won', 'T', 36, (SELECT id_papel FROM Papeis WHERE nome = 'Vocalist'), TO_DATE('2022-05-02', 'YYYY-MM-DD')),
    (21, (SELECT id_grupo FROM Grupos WHERE nome = 'Le Serafim'), 'Huh Yun-jin', 'T', 24, (SELECT id_papel FROM Papeis WHERE nome = 'Vocalist'), TO_DATE('2022-05-02', 'YYYY-MM-DD')),
    (22, (SELECT id_grupo FROM Grupos WHERE nome = 'Le Serafim'), 'Nakamura Kazuha', 'T', 24, (SELECT id_papel FROM Papeis WHERE nome = 'Dancer'), TO_DATE('2022-05-02', 'YYYY-MM-DD')),
    (23, (SELECT id_grupo FROM Grupos WHERE nome = 'Le Serafim'), 'Hong Eun-chae', 'T', 18, (SELECT id_papel FROM Papeis WHERE nome = 'Maknae'), TO_DATE('2022-05-02', 'YYYY-MM-DD'));

CREATE INDEX idx_artistas_id_grupo ON Artistas(id_grupo);

CREATE TABLE Discografia (
    id_disco NUMBER PRIMARY KEY NOT NULL,
    nome_album VARCHAR2(100) NOT NULL,
    lancamento DATE NOT NULL,
    compositores CLOB NOT NULL
);

INSERT INTO Discografia (id_disco, nome_album, lancamento, compositores) VALUES 
    (1, 'SuperJunior05', TO_DATE('2005-11-06', 'YYYY-MM-DD'), 'Lee Soo-man'),
    (2, 'Don’t Don', TO_DATE('2007-09-20', 'YYYY-MM-DD'), 'Lee Soo-man'),
    (3, 'Mr. Simple', TO_DATE('2011-08-03', 'YYYY-MM-DD'), 'Lee Soo-man');

INSERT INTO Discografia (id_disco, nome_album, lancamento, compositores) VALUES 
    (4, 'Crazy', TO_DATE('2022-05-02', 'YYYY-MM-DD'), 'Source Music'),
    (5, 'ANTIFRAGILE', TO_DATE('2022-10-17', 'YYYY-MM-DD'), 'Source Music'),
    (6, 'Fearless', TO_DATE('2022-05-02', 'YYYY-MM-DD'), 'Source Music'),
    (7, 'Unforgiven', TO_DATE('2023-05-01', 'YYYY-MM-DD'), 'Source Music');
    
    