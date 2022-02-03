SELECT COUNT(s.song_name) AS cancoes, COUNT(DISTINCT(ar.artist_name)) AS artistas, COUNT(DISTINCT(al.album_name)) AS albuns 
FROM songs AS s
INNER JOIN artist AS ar ON s.artist_id = ar.artist_id
INNER JOIN album AS al ON s.album_id = al.album_id;