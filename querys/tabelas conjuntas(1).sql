CREATE TABLE grupo_premio(
	id_premio INT NOT NULL,
	id_grupo INT NOT NULL,
	PRIMARY KEY (id_premio, id_grupo),
	CONSTRAINT fk_premio_id
		FOREIGN KEY (id_premio)
		REFERENCES Premios (id_premio),
	CONSTRAINT fk_grupo_id
		FOREIGN KEY (id_grupo)
		REFERENCES Grupos (id_grupo)
);

CREATE TABLE artista_premio(
	id_premio INT NOT NULL,
	id_artista INT NOT NULL,
	PRIMARY KEY (id_premio, id_artista),
	CONSTRAINT fk_premio_id
		FOREIGN KEY (id_premio)
		REFERENCES Premios (id_premio),
	CONSTRAINT fk_artista_id
		FOREIGN KEY (id_artista)
		REFERENCES Artistas (id_artista)
);

CREATE TABLE artista_papel(
	id_papel INT NOT NULL,
	id_artista INT NOT NULL,
	PRIMARY KEY (id_papel, id_artista),
	CONSTRAINT fk_papel_id
		FOREIGN KEY (id_papel)
		REFERENCES Papeis (id_papel),
	CONSTRAINT fk_artista_id
		FOREIGN KEY (id_artista)
		REFERENCES Artistas (id_artista)
);

CREATE TABLE discografia_artista(
	id_artista integer NOT NULL,
	id_discografia integer NOT NULL,
	PRIMARY KEY (id_discografia, id_artista),
	CONSTRAINT fk_artista_id
		FOREIGN KEY (id_artista)
		REFERENCES Artistas (id_artista),
	CONSTRAINT fk_disco_id
		FOREIGN KEY (id_discografia)
		REFERENCES Discografia (id_disco)
);

CREATE TABLE discografia_grupo(
	id_grupo integer NOT NULL,
	id_discografia integer NOT NULL,
	PRIMARY KEY (id_discografia, id_grupo),
	CONSTRAINT fk_grupo_id
		FOREIGN KEY (id_grupo)
		REFERENCES Grupos (id_grupo),
	CONSTRAINT fk_disco_id
		FOREIGN KEY (id_discografia)
		REFERENCES Discografia (id_disco)
);