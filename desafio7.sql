SELECT art.artist_name AS artista,
	alb.album_name AS album,
  COUNT(ufa.artist_id) AS seguidores
	FROM SpotifyClone.artists AS art
  INNER JOIN SpotifyClone.albums AS alb
  ON art.id_artist = alb.artist_id
  INNER JOIN SpotifyClone.user_following_artist AS ufa
  ON ufa.artist_id = art.id_artist
  GROUP BY ufa.artist_id, alb.album_name
  ORDER BY seguidores DESC , artista ASC, album ASC;