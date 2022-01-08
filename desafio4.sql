SELECT u.user_name AS usuario,
	IF(MAX(YEAR(h.date) = 2021), 'Usuário ativo', 'Usuário inativo') AS condicao_usuario
	FROM SpotifyClone.users AS u
  INNER JOIN SpotifyClone.history AS h
  ON u.id_user = h.user_id
  GROUP BY u.user_name
  ORDER BY u.user_name;
