SELECT s.song_name AS cancao,
	COUNT(DISTINCT h.date) AS reproducoes
	FROM SpotifyClone.songs AS s
  INNER JOIN SpotifyClone.history AS h
  ON s.id_song = h.song_id
  GROUP BY song_name
	ORDER BY COUNT(DISTINCT h.date) DESC, s.song_name
  LIMIT 2;