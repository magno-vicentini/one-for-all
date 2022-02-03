SELECT u.user_name AS usuario, COUNT(*) AS qtde_musicas_ouvidas, ROUND(SUM(s.duration_seconds / 60), 2) AS total_minutos
FROM user AS u
INNER JOIN reproductions AS r ON u.user_id = r.user_id
INNER JOIN songs AS s ON s.song_id = r.song_id
GROUP BY u.user_name
ORDER BY u.user_name;