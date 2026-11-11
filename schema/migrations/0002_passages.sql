-- embed-probe 0002: passages without vectors, filled by the shared class dp-lex-embed (Passage purpose). Applied by the Host with search_path ds_embed_probe, public.

CREATE TABLE passages (
    id integer PRIMARY KEY,
    body text NOT NULL,
    embedding vector(1024)
);

INSERT INTO passages (id, body) VALUES
    (1, 'Apples are a sweet fruit that grows on trees.'),
    (2, 'Bananas ripen quickly and turn yellow.'),
    (3, 'Grapes are used to make wine and raisins.'),
    (4, 'Dates are dried fruit common in desert regions.'),
    (5, 'Elderberries are small dark berries used in syrup.');
