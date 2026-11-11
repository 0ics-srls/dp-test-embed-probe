-- embed-probe 0001: synthetic notes with deterministic vectors, plus long texts for the maxBytes Tool. Applied by the Host with search_path ds_embed_probe, public.

CREATE TABLE notes (
    id integer PRIMARY KEY,
    body text NOT NULL,
    embedding vector(1024) NOT NULL
);

INSERT INTO notes (id, body, embedding)
SELECT n.id, n.body,
       (SELECT ('[' || string_agg(round(sin(n.id * j)::numeric, 6)::text, ',' ORDER BY j) || ']')::vector FROM generate_series(1, 1024) AS j)
  FROM (VALUES (1, 'alpha apples'), (2, 'beta banana'), (3, 'gamma grapes'), (4, 'delta dates'), (5, 'epsilon elderberry'), (6, 'zeta figs')) AS n(id, body);

CREATE TABLE blobs (
    id integer PRIMARY KEY,
    body text NOT NULL
);

INSERT INTO blobs SELECT g, repeat('long text ', 30) FROM generate_series(1, 8) AS g;
