SELECT id, body FROM notes
ORDER BY CASE WHEN @q_vec IS NOT NULL THEN embedding <=> CAST(@q_vec AS vector) END ASC NULLS LAST,
         ts_rank(to_tsvector('simple', body), plainto_tsquery('simple', @query)) DESC, id
