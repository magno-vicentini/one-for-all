SELECT reproduction_history AS cancao, COUNT(song_id) AS reproducoes 
FROM SpotifyClone.reproductions
GROUP BY reproduction_history
ORDER BY reproducoes DESC, reproduction_history
LIMIT 2;