SELECT COUNT(r.user_id) AS quantidade_musicas_no_historico
FROM reproductions AS r
INNER JOIN user AS u ON u.user_id = r.user_id
WHERE u.user_name = 'Bill';