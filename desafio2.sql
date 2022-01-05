SELECT COUNT(songs.song_name) AS cancoes, 
	COUNT(DISTINCT albums.artist_id) AS artistas,
	COUNT(DISTINCT songs.album_id) AS albuns
	FROM SpotifyClone.songs AS songs
	INNER JOIN SpotifyClone.albums AS albums
	ON songs.album_id = albums.id_album;