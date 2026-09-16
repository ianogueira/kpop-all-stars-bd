CREATE TABLE Grupo_Premios (
    id_grupo NUMBER NOT NULL,
    id_premio NUMBER NOT NULL,
    PRIMARY KEY (id_grupo, id_premio),
    CONSTRAINT fk_grupo_premios_grupo FOREIGN KEY (id_grupo) REFERENCES Grupos(id_grupo) ON DELETE CASCADE,
    CONSTRAINT fk_grupo_premios_premio FOREIGN KEY (id_premio) REFERENCES Premios(id_premio) ON DELETE CASCADE
);

INSERT INTO Grupo_Premios VALUES (1, 1), (1,2), (2, 3), (2,7);

CREATE TABLE Artista_Papel (
    id_artista NUMBER NOT NULL,
    id_papel NUMBER NOT NULL,
    PRIMARY KEY (id_artista, id_papel),
    CONSTRAINT fk_artista_papel_artista FOREIGN KEY (id_artista) REFERENCES Artistas(id_artista) ON DELETE CASCADE,
    CONSTRAINT fk_artista_papel_papel FOREIGN KEY (id_papel) REFERENCES Papeis(id_papel) ON DELETE CASCADE
);

CREATE TABLE Discografia_Grupo (
    id_disco NUMBER NOT NULL,
    id_grupo NUMBER NOT NULL,
    PRIMARY KEY (id_disco, id_grupo),
    CONSTRAINT fk_discografia_grupo_disco FOREIGN KEY (id_disco) REFERENCES Discografia(id_disco) ON DELETE CASCADE,
    CONSTRAINT fk_discografia_grupo_grupo FOREIGN KEY (id_grupo) REFERENCES Grupos(id_grupo) ON DELETE CASCADE
);

INSERT INTO Discografia_Grupo (id_grupo, id_disco) VALUES (1,1), (1,2), (1,3), (6, 4), (6,5), (6,7);

CREATE TABLE Artista_Premio(
    id_artista NUMBER NOT NULL,
    id_premio NUMBER NOT NULL,
    CONSTRAINT fk_apr_artista FOREIGN KEY (id_artista) REFERENCES Artistas(id_artista) ON DELETE CASCADE,
    CONSTRAINT fk_apr_premio FOREIGN KEY (id_premio) REFERENCES Premios(id_premio) ON DELETE CASCADE,
    PRIMARY KEY (id_artista, id_premio)
);

CREATE TABLE Discografia_Artista(
    id_disco NUMBER NOT NULL,
    id_artista NUMBER NOT NULL,
    CONSTRAINT fk_da_disco FOREIGN KEY (id_disco) REFERENCES Discografia(id_disco) ON DELETE CASCADE,
    CONSTRAINT fk_da_artista FOREIGN KEY (id_artista) REFERENCES Artistas(id_artista) ON DELETE CASCADE,
    PRIMARY KEY (id_disco, id_artista)
);
