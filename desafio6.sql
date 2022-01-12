SELECT MIN(pl.price) AS faturamento_minimo,
	MAX(pl.price) AS faturamento_maximo,
  TRUNCATE(AVG(pl.price), 2) AS faturamento_medio,
  SUM(pl.price) AS faturamento_total
	FROM SpotifyClone.plans AS pl
  INNER JOIN SpotifyClone.users AS u
  ON pl.id_plan = u.plan_id;