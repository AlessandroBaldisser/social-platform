Milestone 2

Creazione tabelle

TABLE utente:
    -id_utente (INT NOT NULL AUTO_INCREMENT PRIMARY KEY),
    -nome (VARCHAR (40) NOT NULL UNIQUE),
    -data_di_nascita (date),      -> nella data di nascita ovviamente ci interessa solo il giorno, mese, anno, non è obbligatorio se un utente non vuole dichiararlo
    -email (VARCHAR (40) NOT NULL UNIQUE),
    -password (VARCHAR (40) NOT NULL),
    -data_creazione(TIMESTAMP DEFAULT CURRENT_TIMESTAMP)  ->  timestamp formato YYYY-MM__DD HH:MM:SS, "DEFAULT CURRENT_TIMESTAMP" imposta data e ora corrente al momento della creazione se non viene inserito un valore esplicitamente.

Riferimenti alle altre tabelle: 
-un utente può mettere più post: ONE(utente) to MANY(post),
-un utente può mettere like a più post: ONE(utente) to MANY(like)
-un utente può lasciare più commenti su più post: ONE(utente) to MANY



TABLE post:
    -id_post (INT NOT NULL AUTO_INCREMENT PRIMARY KEY),
    -contenuto (TEXT),   ->  non utilizziamo un varchar dato che ha un limite di 255 caratteri
    -data_creazione(TIMESTAMP DEFAULT CURRENT_TIMESTAMP),
    -id_utente (INT),
    -foreign key (id_utente) references utente(id_utente)

Riferimenti:
-un post può avere più media come foto e video: ONE(post) to MANY(media)
-un post può avere più tags: ONE(post) to MANY(tags)
-un post può avere più commenti: ONE(post) to MANY(commenti)
-un post può avere più likes: ONE(post) to MANY(like)



TABLE media:
    -id_media (INT NOT NULL AUTO_INCREMENT PRIMARY KEY),
    -id_post (INT),
    -foreign key (id_post) REFERENCES post(id_post)


TABLE tags:
    -id_tags (INT NOT NULL AUTO_INCREMENT PRIMARY KEY),
    -nome_tags (VARCHAR(50)),
    -id_post INT,
    -foreign key (id_post) REFERENCES post (id_post)


TABLE like:
    -data_creazione(TIMESTAMP DEFAULT CURRENT_TIMESTAMP)
    -id_utente INT,
    -id_post INT,
    -PRIMARY KEY (id_utente, id_post)
    -foreign key(id_utente) REFERENCES utente (id_utente),
    -foreign key(id_post) REFERENCES post (id_post)

Relazione MANY to MANY: un post può avere like da più utenti e un utente può mettere like a più post


TABLE commenti:
    -id_commento (INT NOT NULL AUTO_INCREMENT PRIMARY KEY)
    -testo (TEXT),
    -data_creazione(TIMESTAMP DEFAULT CURRENT_TIMESTAMP),
    -id_post INT,
    -id_utente INT
    -foreign key (id_post) REFERENCES post (id_post),
    -foreign key (id_utente) REFERENCES utente (id_utente),


