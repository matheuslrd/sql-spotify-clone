SELECT u.user_name AS usuario,
	COUNT(DISTINCT h.`date`) AS qtde_musicas_ouvidas,
    ROUND(SUM(s.time_length / 60), 2) AS total_minutos
	FROM SpotifyClone.users AS u
    INNER JOIN SpotifyClone.`history` AS h
    ON u.id_user = h.user_id
    INNER JOIN SpotifyClone.songs AS s
    ON s.id_song = h.song_id
    GROUP BY u.user_name;

