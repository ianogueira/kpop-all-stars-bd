INSERT INTO Artistas(id_artista, nome, ativo, meses_treino, id_papel, debute) VALUES (24, 'Chung Ha', 'T', 36, (SELECT id_papel FROM Papeis WHERE nome = 'Soloist'), TO_DATE('2017-07-04', 'YYYY-MM-DD'));
INSERT INTO Artistas(id_artista, nome, ativo, meses_treino, id_papel, debute) VALUES (25, 'Rosé', 'T', 36, (SELECT id_papel FROM Papeis WHERE nome = 'Soloist'), TO_DATE('2021-03-12', 'YYYY-MM-DD'));

INSERT INTO Discografia(id_disco, nome_album, lancamento, compositores) VALUES (8, 'R', TO_DATE('2021-03-12', 'YYYY-MM-DD'), 'Rosé');
INSERT INTO Discografia(id_disco, nome_album, lancamento, compositores) VALUES (9, 'rosie', TO_DATE('2024-12-06', 'YYYY-MM-DD'), 'Rosé');

SELECT * FROM Artistas WHERE id_grupo = 1;
SELECT * FROM Papeis;
SELECT * FROM Papeis WHERE id_papel = 6;
SELECT nome FROM Empresas;
SELECT nome FROM Grupos WHERE id_empresa = 3;
SELECT nome FROM Artistas WHERE id_grupo = 1;
SELECT * FROM discografia_grupo WHERE id_grupo = 1;